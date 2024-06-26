<%
    from _metadata import constants
    import re

    def to_snake_case(name):
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

    previous = ""
%>\
"""This module defines constants for trigger and clock terminal names."""

# This file was generated
% for name, data in constants.items():
<% if not isinstance(data["value"], str): continue %>\
% if name.endswith("0"):

% endif
% if data["value"].startswith("PXI"):
${data["value"].upper()} = "${data["value"]}"
% else:
${to_snake_case(data["value"]).upper()} = "${data["value"]}"
% endif
<% previous = name %>\
% endfor
