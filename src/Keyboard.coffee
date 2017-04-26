blessed = require 'blessed'

KEY_W =4
KEY_H = 3

# http://www.keyboard-layout-editor.com/
layout = [
    ["Esc",{x:1},"F1","F2","F3","F4",{x:0.5},"F5","F6","F7","F8",{x:0.5},"F9","F10","F11","F12",{x:0.25},"PrtSc","Scroll Lock","Pause\nBreak"],
    [{y:0.5},"~\n`","!\n1","@\n2","#\n3","$\n4","%\n5","^\n6","&\n7","*\n8","(\n9",")\n0","_\n-","+\n=",{w:2},"Backspace",{x:0.25},"Insert","Home","PgUp",{x:0.25},"Num Lock","/","*","-"],
    [{w:1.5},"Tab","Q","W","E","R","T","Y","U","I","O","P","{\n[","}\n]",{w:1.5},"|\n\\",{x:0.25},"Delete","End","PgDn",{x:0.25},"7\nHome","8\n↑","9\nPgUp",{h:2},"+"],
    [{w:1.75},"Caps Lock","A","S","D","F","G","H","J","K","L",":\n;","\"\n'",{w:2.25},"Enter",{x:3.5},"4\n←","5","6\n→"],
    [{w:2.25},"Shift","Z","X","C","V","B","N","M","<\n,",">\n.","?\n/",{w:2.75},"Shift",{x:1.25},"↑",{x:1.25},"1\nEnd","2\n↓","3\nPgDn",{h:2},"Enter"],
    [{w:1.25},"Ctrl",{w:1.25},"Win",{w:1.25},"Alt",{a:7,w:6.25},"",{a:4,w:1.25},"Alt",{w:1.25},"Win",{w:1.25},"Menu",{w:1.25},"Ctrl",{x:0.25},"←","↓","→",{x:0.25,w:2},"0\nIns",".\nDel"]
    ]

class key extends blessed.Box
    constructor: (args)->
        args.width  = KEY_W if args.width  is 0
        args.height = KEY_H if args.height is 0
        
        super 
            top: args.top
            left: args.left
            width: args.width+1
            height: args.height+1
            border: "line"
            content: args.char
            style:
                hover: 
                    bg: "white"
                    fg: "black"

class keyboard extends blessed.Box
    constructor: (args)->
        super args
        super 
            draggable: true
            # top: 'top'
            # left: 'center'
            width: 'shrink'
            height: 'shrink'
            content: 'Keyboard'
            tags: true
            border: type: 'line'
        y = 1
        w = 0
        h = 0
        for row in layout
            x = 0.0
            for col in row
                if typeof(col) is "string"
                    @append new key
                        char: col
                        top: y
                        left: x | 0
                        width: w | 0
                        height: h | 0
                    x+= if w then w else KEY_W                        
                else 
                    w = col.w*KEY_W
                    h = col.h*KEY_H
                    x+= col.x*KEY_W if col.x?
                    continue
                w = 0
                h = 0

            y+=KEY_H

module.exports = keyboard