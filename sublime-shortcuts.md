commands:

	[
		{ "keys": ["ctrl+;"], "command": "toggle_comment", "args": { "block": false } },
		{ "keys": ["ctrl+shift+;"], "command": "toggle_comment", "args": { "block": true } },
		{ "keys": ["ctrl+."], "command": "insert_snippet", "args": {"contents": "|"} },
		{ "keys": ["ctrl+shift+s"], "command": "save_all" },
		{ "keys": ["ctrl+s"], "command": "save" },
		{ "keys": ["ctrl+shift+w"], "command": "close_all" },
		{ "keys": ["ctrl+w"], "command": "close" }
	]