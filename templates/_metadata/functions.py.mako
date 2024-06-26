# This file was generated

functions = {
%  for func in merged_functions:
     '${func['name'].replace('niSync_','')}': {
        'returns': '${func['returns'].replace('_VI_FUNC','').replace('kNICPPHeader','').strip()}',
        'parameters': [
%       for param in func['parameters']:
           {
               'direction': '${'out' if param['pointer'] or param['array'] else 'in'}',
               'name': '${param['name']}',
               'type': '${param['type'].split()[0]}',
           },
%       endfor
        ],
        'codegen_method': 'public',
        'visibility': '${'private' if func in headers['internal.h'].functions else 'public'}',
    },
%   endfor
}