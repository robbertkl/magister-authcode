#!/bin/sh

cd `dirname "${0}"`

die() {
    1>&2 echo "Error:" "${@}"
    exit 1
}

test -z "${GITHUB_USER}" && die "missing GITHUB_USER environment variable"
test -z "${GITHUB_TOKEN}" && die "missing GITHUB_TOKEN environment variable"
test -z "${GIST_ID}" && die "missing GIST_ID environment variable"
test -z "${GIST_FILE}" && die "missing GIST_FILE environment variable"
test -z "${INTERVAL}" && die "missing INTERVAL environment variable"

FILE_OLD=/tmp/authcode_old
FILE_NEW=/tmp/authcode_new
PIPE=/tmp/pipe

curl \
    --silent \
    --fail \
    --output "${FILE_OLD}" \
    "https://gist.githubusercontent.com/${GITHUB_USER}/${GIST_ID}/raw/${GIST_FILE}" \
|| die "error fetching gist"

echo "Last known authcode:" `cat "${FILE_OLD}"`

while :
do
    rm -f "${PIPE}"
    mkfifo "${PIPE}"
    tr -d '\n' < "${PIPE}" > "${FILE_NEW}" &
    phantomjs --load-images=false fetch.js > "${PIPE}"
    if [ $? -eq 0 ]
    then
        if ! diff -q "${FILE_OLD}" "${FILE_NEW}" > /dev/null
        then
            echo "Found new authcode:" `cat "${FILE_NEW}"`
            CONTENT=`cat "${FILE_NEW}" | sed 's/"/\\\\"/g'`
            curl \
                --silent \
                --fail \
                --output /dev/null \
                --request PATCH \
                --header "Authorization: Bearer ${GITHUB_TOKEN}" \
                --header "Content-Type: application/json" \
                --data '{"files": {"'"${GIST_FILE}"'": {"content": "'"${CONTENT}"'"}}}' \
                "https://api.github.com/gists/${GIST_ID}" \
            || die "could not update gist"
            mv "${FILE_NEW}" "${FILE_OLD}"
        fi
    fi
    sleep "${INTERVAL}"
done
