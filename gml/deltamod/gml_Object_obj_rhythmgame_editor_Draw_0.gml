draw_self();
draw_set_font(scr_84_get_font("main"));
draw_set_color(c_black);
draw_set_alpha(0.75);
ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, false);
draw_set_alpha(1);

if (song_menu)
{
    draw_set_color(c_black);
    var _xalign = camerax() + 220;
    var _yalign = cameray() + 80;
    draw_set_color(c_gray);
    scr_draw_simple_menu(selection, _xalign, _yalign, 16, tracklist, 16777215);
    _xalign = camerax() + 320;
    _yalign -= 20;
    draw_set_halign(fa_center);
    
    if (instrument == 1)
    {
        draw_set_color(#EA79C8);
        draw_sprite(spr_board_susie_walk_down, 0, _xalign - 100 - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#EA79C8, c_black, 0.5));
    }
    
    draw_text(_xalign - 100, _yalign, "DRUMS");
    
    if (instrument == 0)
    {
        draw_set_color(#00A2E8);
        draw_sprite(spr_board_kris_walk_down, 0, _xalign - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#00A2E8, c_black, 0.5));
    }
    
    draw_text(_xalign, _yalign, "GUITAR");
    
    if (instrument == 2)
    {
        draw_set_color(#B5E61D);
        draw_sprite(spr_board_ralsei_walk_down, 0, (_xalign + 100) - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#B5E61D, c_black, 0.5));
    }
    
    if (selection == 0 || selection == 2 || file_exists(program_directory + "/SongCharts/music_timing_customsong_lyrics" + string(dojoEncounter[selection] - 4) + ".txt"))
        draw_text(_xalign + 100, _yalign, "VOCALS");
    else
        draw_text(_xalign + 100, _yalign, "TAMBOURINE");
    
    draw_set_color(c_gray);
    draw_set_halign(fa_right);
    draw_text(_xalign + 300, _yalign, string_hash_to_newline("[Z] Select Song.#[X] Exit Editor.##[<->] Select#Instrument."));
    draw_set_halign(fa_left);
    exit;
}

if (song_initialized)
{
    if (!paused || scrollcon < 2)
        trackpos = audio_sound_get_track_position(track1_instance);
    
    bottomy = cameray() + 270;
    var _notespeed = notespeed;
    var _centerx = camerax() + 320;
    scr_rhythmgame_draw_backing(_notespeed, _centerx, true);
    var _remcolor = 8421504;
    
    if (rem_pos >= 0)
    {
        if (rem_mode)
            _remcolor = 255;
        
        draw_set_color(_remcolor);
        var _rem_y = (bottomy - (rem_pos * _notespeed)) + (trackpos * _notespeed);
        ossafe_fill_rectangle(camerax() + 270, _rem_y, camerax() + 360, _rem_y, true);
    }
    
    draw_set_color(merge_color(c_fuchsia, c_white, 2 / (pressedtimer[0] + 1)));
    draw_line(camerax(), bottomy, _centerx, bottomy);
    draw_set_color(merge_color(c_blue, c_white, 2 / (pressedtimer[1] + 1)));
    draw_line(_centerx, bottomy, camerax() + 640, bottomy);
    draw_set_color(c_white);
    var _xstart = (instrument == 2) ? (camerax() + 280) : (camerax() + 285);
    var _xwidth = (instrument == 2) ? 30 : 40;
    scr_rhythmgame_draw(_notespeed, _centerx, true);
    
    if (do_refresh)
        do_refresh = false;
    
    if (missnotecon == 1)
    {
        snd_play_x(snd_hurt1, 0.6, 0.9);
        note_streak = 0;
        combo -= 200;
        
        if (instrument == 0)
        {
            if (oneAtATime)
                mus_volume(track1_instance, 1, 0);
            
            mus_volume(track2_instance, 0, 0);
        }
        
        missnotecon = 2;
        missnotetimer = 0;
    }
    
    if (!paused)
    {
        if (keyboard_check_pressed(ord("Z")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 0);
            rec_hold = trackpos;
        }
        
        if (keyboard_check_pressed(ord("X")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 1);
            rec_hold = trackpos;
        }
        
        if (instrument != 0 && keyboard_check_pressed(ord("C")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 2);
            rec_hold = trackpos;
        }
    }
    
    if (rec_hold > 0 && !keyboard_check(ord("Z")) && !keyboard_check(ord("X")) && !keyboard_check(ord("C")))
    {
        if ((trackpos - rec_hold) > 0.25 || instrument == 2)
            rec_endtime[rec_count - 1] = trackpos;
        
        rec_hold = 0;
    }
    
    if (keyboard_check_pressed(vk_backspace))
    {
        rec_count = 0;
        rec_hold = 0;
    }
    
    draw_set_color(c_gray);
    draw_set_blend_mode(bm_add);
    
    for (i = 0; i < rec_count; i++)
    {
        var _type = rec_type[i] * 40;
        
        if (instrument == 2)
            _type *= 0.75;
        
        var _rec_line = bottomy + ((trackpos - rec_time[i]) * _notespeed);
        
        if (_rec_line < (cameray() - 20) || (_rec_line > (cameray() + 500) && rec_endtime[i] <= 0))
            continue;
        
        if (instrument != 2 || paused)
        {
            if (rec_type[i] == 0)
            {
                if (instrument == 2)
                    ossafe_fill_rectangle(camerax() + 250, _rec_line - 1, camerax() + 290, _rec_line + 1, 1);
                else
                    ossafe_fill_rectangle(camerax() + 250, _rec_line - 1, camerax() + 310, _rec_line + 1, 1);
            }
            else if (rec_type[i] == 1)
            {
                if (instrument == 2)
                    ossafe_fill_rectangle(camerax() + 295, _rec_line - 1, camerax() + 335, _rec_line + 1, 1);
                else
                    ossafe_fill_rectangle(camerax() + 320, _rec_line - 1, camerax() + 380, _rec_line + 1, 1);
            }
            else if (rec_type[i] == 2)
            {
                if (instrument == 2)
                    ossafe_fill_rectangle(camerax() + 340, _rec_line - 2, camerax() + 380, _rec_line + 2, 1);
                else
                    ossafe_fill_rectangle(camerax() + 240, _rec_line - 2, camerax() + 390, _rec_line + 2, 1);
            }
        }
        
        if (instrument != 1 && rec_endtime[i] > 0)
        {
            var notelength = (rec_endtime[i] - rec_time[i]) * _notespeed;
            
            if (instrument == 2)
                ossafe_fill_rectangle(camerax() + 270 + _type + 10, _rec_line - notelength, camerax() + 270 + _type + 20, _rec_line, true);
            else
                ossafe_fill_rectangle(camerax() + 280 + _type + 10, _rec_line - notelength, camerax() + 280 + _type + 20, _rec_line, true);
        }
    }
    
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(spr_whitegradientdown_center, 0, camerax() + 320, cameray() + 400, 16, 4, 0, c_black, 1);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax() + 0, 400, camerax() + 640, 480, false);
    draw_set_color(c_red);
    draw_text(camerax() + 0, 0, trackpos);
    draw_text(camerax() + 0, 30, remtrackpos[3]);
    
    if (maxnote > 0)
        draw_text(camerax() + 0, 60, notetime[0]);
    
    draw_text(camerax() + 0, 90, trackpos / meter);
    draw_set_color(c_white);
    scr_draw_circle_width_radius(camerax() + 500, 400, 50, 46, 24);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax() + 450, 400, camerax() + 550, 450, false);
    draw_set_color(c_red);
    draw_sprite_ext(spr_werewire_throwarrow, 0, camerax() + 500, 400, 1, 1, 180 - (((combo + hold_score) / max_score) * 180), c_white, 1);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text_transformed(camerax() + 500, 400, total_score + hold_score, score_scale, score_scale, 0);
    
    if (score_scale > 2)
        score_scale = scr_movetowards(score_scale, 2, 0.2);
    
    if (note_streak > 0)
        draw_text_transformed(camerax() + 320, 400, string(note_streak), 2, 2, 0);
    
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    ossafe_fill_rectangle((camerax() + 640) - 25, (cameray() + 480) - 25, (camerax() + 640) - 15, (cameray() + 480) - 15, false);
    ossafe_fill_rectangle((camerax() + 640) - 25, cameray() + 15, (camerax() + 640) - 15, cameray() + 25, false);
    ossafe_fill_rectangle((camerax() + 640) - 22, cameray() + 20, (camerax() + 640) - 18, (cameray() + 480) - 20, false);
    
    if (last_pause >= 0)
        draw_sprite_ext(spr_rhythmgame_editor_arrow, 0, (camerax() + 640) - 38, lerp((cameray() + 480) - 21, cameray() + 19, last_pause / track_length), 1, 1, 0, _remcolor, 1);
    
    if (rem_pos >= 0)
        draw_sprite_ext(spr_sneo_bullet_arrow, 0, (camerax() + 640) - 38, lerp((cameray() + 480) - 21, cameray() + 19, rem_pos / track_length), 1, 1, 0, _remcolor, 1);
    
    var _walk_sprite = asset_get_index("spr_board_kris_walk_down");
    
    if (instrument == 1)
        _walk_sprite = asset_get_index("spr_board_susie_walk_down");
    else if (instrument == 2)
        _walk_sprite = asset_get_index("spr_board_ralsei_walk_down");
    
    gpu_set_fog(true, c_black, 0, 1);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length) - 1);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length) + 1);
    gpu_set_fog(false, c_black, 0, 0);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length));
    
    if (savecon != 0 || changesmade)
    {
        var _savestring = "";
        
        if (savecon == 1)
        {
            if (has_file && load_source == 2)
                _savestring = string_hash_to_newline("Do you want to save this track?#This will OVERWRITE current save file#Z: I want this, X: Do not#C: I want for Hard Mode");
            else
                _savestring = string_hash_to_newline("Do you want to save this track?#Unsaved changes will be saved#Z: I want this, X: Do not#C: I want for Hard Mode");
        }
        else if (savecon == 2)
        {
            _savestring = string_hash_to_newline("Track has been saved.##Z/X: Cool");
        }
        else if (savecon == -1)
        {
            _savestring = string_hash_to_newline("What do you want to load?#Unsaved changes will vanish forever.#1/Z: Manual Save, 2: Auto-Save#3: Exported chart, 4/X: Nevermind#C: Hard Mode Save");
        }
        else if (savecon == -2)
        {
            _savestring = string_hash_to_newline("Track has been loaded.##Z/X: Cool");
        }
        else if (savecon == -3)
        {
            _savestring = string_hash_to_newline("No save file has been found in local folder.##Z/X: Aww");
        }
        else if (changesmade)
        {
            _savestring = "You have unsaved changes!";
        }
        
        draw_text(camerax() + 10, (cameray() + 480) - 300, _savestring);
    }
    
    if (paused)
    {
        draw_sprite(spr_poppup_mouse, 0, mouse_x, mouse_y);
        
        if (mouse_x >= (camerax() + 250) && mouse_x <= (camerax() + 380))
        {
            var _prec = keyboard_check(vk_lalt) ? 3 : 4;
            
            if (keyboard_check(vk_ralt))
                _prec *= 2;
            
            var _mouse_pos = scr_round_to_beat(trackpos + ((bottomy - mouse_y) / _notespeed), bpm, _prec);
            var _mouse_height = bottomy - ((_mouse_pos - trackpos) * _notespeed);
            var _mouse_side = (mouse_x < (camerax() + 320)) ? 0 : 1;
            
            if (instrument == 2)
            {
                if (mouse_x > (camerax() + 335))
                    _mouse_side = 2;
                else if (mouse_x > (camerax() + 305))
                    _mouse_side = 1;
                else
                    _mouse_side = 0;
            }
            else if (instrument == 1 && keyboard_check(vk_lshift))
            {
                _mouse_side = 2;
            }
            
            var _highlighted_note = collision_point(mouse_x, mouse_y, obj_rhythmgame_editor_note_node, false, true);
            var _lastmouse = mousecon;
            
            if (mouse_button == mb_left)
                mousecon = 1;
            else if (mouse_button == mb_right)
                mousecon = 2;
            else
                mousecon = 0;
            
            if (mousecon == 1 && _lastmouse == 0)
            {
                if (_highlighted_note != -4)
                {
                    notemod_index = _highlighted_note.noteindex;
                    
                    if (keyboard_check(vk_lshift) && instrument != 1)
                    {
                        noteeditmode = 2;
                    }
                    else if (keyboard_check(vk_lcontrol))
                    {
                        scr_rhythmgame_editor_note_anim(notemod_index);
                        noteeditmode = 3;
                    }
                    else
                    {
                        noteeditmode = 1;
                    }
                }
            }
            
            if (mousecon == 1 && noteeditmode == 2)
            {
                var _notetype = notetype[notemod_index];
                var notey = (bottomy - (notetime[notemod_index] * _notespeed)) + (trackpos * _notespeed);
                var notelength = (_mouse_pos - notetime[notemod_index]) * _notespeed;
                var _longx = _xstart;
                
                if (instrument == 2)
                    _longx -= 5;
                
                ossafe_fill_rectangle(_longx + (_notetype * _xwidth) + 12, notey - notelength, _longx + (_notetype * _xwidth) + 18, notey, false);
            }
            
            if (_lastmouse == 1 && mousecon == 0)
            {
                if (noteeditmode == 1)
                {
                    if (notetime[notemod_index] != _mouse_pos || notetype[notemod_index] != _mouse_side)
                    {
                        scr_rhythmgame_editor_move_note(notemod_index, _mouse_pos, _mouse_side, noteend[notemod_index]);
                        changesmade = true;
                    }
                }
                else if (noteeditmode == 2)
                {
                    var _endtime = 0;
                    
                    if (_mouse_pos > notetime[notemod_index])
                        _endtime = _mouse_pos;
                    
                    if (_endtime != noteend[notemod_index])
                    {
                        scr_rhythmgame_editor_record_undo(notemod_index);
                        changesmade = true;
                        noteend[notemod_index] = _endtime;
                        scr_rhythmgame_editor_refresh();
                    }
                }
                else if (noteeditmode == 3)
                {
                    mousecon = 0;
                }
                else
                {
                    mousecon = 0;
                    newnote_time = _mouse_pos;
                    newnote_type = _mouse_side;
                    
                    if (instrument == 2 && !keyboard_check(vk_lcontrol))
                        scr_rhythmgame_editor_insert_note(_mouse_pos, _mouse_side, _mouse_pos + (meter / 16));
                    else
                        scr_rhythmgame_editor_insert_note(_mouse_pos, _mouse_side);
                }
                
                notemod_index = -1;
                noteeditmode = 0;
            }
            
            if (_lastmouse == 2)
            {
                if (_highlighted_note != -4)
                {
                    _highlighted_note.active = false;
                    scr_rhythmgame_editor_delete_note(_highlighted_note.noteindex);
                }
            }
            
            var _outline = (mousecon == 0) ? 1 : 0;
            var _xoff = _mouse_side * _xwidth;
            var _rx = _xwidth - 10;
            
            if (noteeditmode == 1)
            {
                var _note_height = bottomy - ((notetime[notemod_index] - trackpos) * _notespeed);
                var _note_xoff = notetype[notemod_index] * _xwidth;
                draw_set_color(c_yellow);
                ossafe_fill_rectangle((_xstart + _note_xoff) - 2, _note_height - 5, _xstart + _rx + _note_xoff + 2, _note_height + 5, false);
                draw_set_color(c_gray);
                ossafe_fill_rectangle(_xstart + _note_xoff, _note_height - 3, _xstart + _rx + _note_xoff, _note_height + 3, false);
            }
            else if (_highlighted_note != -4)
            {
                draw_set_color(c_yellow);
                ossafe_fill_rectangle(_xstart + _xoff, _mouse_height - 3, _xstart + _rx + _xoff, _mouse_height + 3, false);
            }
            
            draw_set_color(c_red);
            ossafe_fill_rectangle(_xstart + _xoff, _mouse_height - 3, _xstart + _rx + _xoff, _mouse_height + 3, _outline);
        }
        else if (mousecon == 1 && mouse_button != mb_left)
        {
            mousecon = 0;
        }
        
        draw_text(camerax() + 20, (cameray() + 480) - 60, "scrollcon = " + string(scrollcon));
        draw_sprite(spr_sneo_playback, 1, camerax() + 40, (cameray() + 480) - 40);
    }
    
    draw_set_halign(fa_right);
    var _message;
    
    if (tooltips)
        _message = string_hash_to_newline("LMB: Write#RMB: Erase#Shift+LMB on existing note: Extend#Alt: Snap to thirds#Space/P: Pause/Play#-/+ (=): Zoom in/out#W/E: Disable/Enable guitar stem#T: Refresh notes#V: Set playback start#B: Toggle playback start#N: Return to playback start#Backspace: Clear note memory#Q: Autoplay#U: Save#I: Load#R: Open Instrument Select Menu#Tab: Hide tooltips");
    else
        _message = string_hash_to_newline("Tab: Show tooltips");
    
    draw_text((camerax() + 640) - 40, cameray() + 20, _message);
    draw_set_halign(fa_left);
}
