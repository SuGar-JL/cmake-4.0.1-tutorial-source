#!/bin/bash

for dir in Step*/; do
    dirname="${dir%/}"
    echo "==================== ${dirname} ===================="
    if [ -f "${dirname}/test.sh" ]; then
        cd "${dirname}" || exit 1
        rm -rf build
        echo "run ${dirname}/test.sh..."
        chmod +x test.sh
        ./test.sh || exit 1
        cd ..
    else
        echo "skip (no test.sh)"
    fi
done

echo "Done"
exit 0
