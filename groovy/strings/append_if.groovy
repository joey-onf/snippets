#!/usr/bin/env groovy
// -----------------------------------------------------------------------
// Intent: Construct a string conditionally using the ternary operator.
// -----------------------------------------------------------------------

String buffer = 'abc'

Boolean append_a = false
Boolean append_b = ! append_a

buffer += (append_a) ? '.a'
            : (append_b)  ? '.b'
            : '.c'

println(buffer)

// [EOF]
