

blessed = require 'blessed'

keyboard = require './src/Keyboard'

# Create a screen object.
screen = blessed.screen
    smartCSR: true
    dockBorders: true
    
screen.title = 'my window title'
# Create a box perfectly centered horizontally and vertically.

# Append our box to the screen.
keyboard = new keyboard
screen.append keyboard


# Quit on Escape, q, or Control-C.
screen.key [
  'escape'
  'q'
  'C-c'
], (ch, key) ->
  process.exit 0

# Focus our element.
keyboard.focus()
# Render the screen.
screen.render()