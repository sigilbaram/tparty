# tparty

Displays the TP of party members in the party list.
Loosely based on the addon of the same name for Windower 4 by Cliff.

## Settings
### Party Window Settings
- `party.x_right` Distance the window sits from the right side of the screen
- `party.y_bottom` Distance the window sits from the bottom of the screen
- `party.width` Width of the party window
- `party.additional_height` Extra height added to the window independent of party size
- `party.height_per_member` Height added to the window for each party member and used for vertical spacing of elements
- `party.top_padding` Distance from the top of the window to the first party member
- `party.tp_x` Horizontal distance the TP text is set from the top left of the party member
- `party.tp_y` Vertical distance the TP text is set from the top left of the party member

### Text Style Settings
- `text.color` Normal color of the TP text
- `text.tp_full_color` Color of the TP text when over 1000
- `text.stroke_color` Stroke color of the TP text
- `text.font` Font of the TP text
- `text.party_font_size` Font size of the TP text of the party

## Notes
- There is an extra 1 pixel gap between the first party member and the rest of the party or, when solo, the bottom of the window. This is part of `additional_height` and added to the y position of party members 2-6.
- The height of the party window is `(party_size * party.height_per_member) + party.additional_height`.

## TODO
- Implement alliances? The v4 version wasn't doing this.
