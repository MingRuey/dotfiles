#!/usr/bin/python
import sys
import datetime

template = """ > {date}

=== Daily Hightlight ===

    ## Day: [The Item]()
        > Context && Justification

    ## Night:: [The Item]()
        > Context && Justification

== Reading ==
    * [] Item

== Todo list ==
    * [] Item

== Notes ==
"""

date = (datetime.date.today() if len(sys.argv) < 2
                # Expecting filename in YYYY-MM-DD.foo format
                        else sys.argv[1].rsplit(".", 1)[0])

print(template.format(date=date))