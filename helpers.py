import functools
import re
import sys
from difflib import ndiff

try:
    from StringIO import StringIO
except ImportError:
    from io import StringIO


def test_module_doc(doc, main):
    search = re.search(r'^\n(.*)\n\n(.*)$', doc, re.DOTALL)
    test_input = search.group(1)
    expected_test_output = search.group(2)

    sys.stdin = StringIO(test_input)
    sys.stdout = StringIO()

    main()

    sys.stdin = sys.__stdin__
    test_result = str(sys.stdout.getvalue())
    sys.stdout = sys.__stdout__

    diff = ndiff(expected_test_output.splitlines(1), test_result.splitlines(1))
    error_message = '\n{}\n{}\n'.format(test_result, expected_test_output)
    error_message = '\n{}'.format(''.join(diff))

    assert test_result == expected_test_output, error_message


def memoize(obj):
    cache = obj.cache = {}

    @functools.wraps(obj)
    def memoizer(*args, **kwargs):
        if args not in cache:
            cache[args] = obj(*args, **kwargs)
        return cache[args]
    return memoizer
