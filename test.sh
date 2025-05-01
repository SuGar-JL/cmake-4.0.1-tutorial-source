#!/bin/bash

for dir in Step*/; do
    dirname="${dir%/}"
    echo "==================== ${dirname} ===================="
    if [ -f "${dirname}/test.sh" ]; then
        cd "${dirname}" || exit 1
        echo "run ${dirname}/test.sh..."
        ./test.sh || exit 1
    else
        echo "skip (no test.sh)"
    fi
done

echo "Done"
exit 0
