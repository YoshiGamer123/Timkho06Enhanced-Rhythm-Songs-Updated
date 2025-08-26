if (i_ex(obj_room_castle_tv_rhythm) && obj_room_castle_tv_rhythm.AlbumArg == -1 && file_exists("SongCharts/AlbumsInfo.txt"))
{
    var _file = file_text_open_read("SongCharts/AlbumsInfo.txt");
    var l_arg = [];
    var l_ind = 0;
    AlbumArg = [];
    
    if (_file != -1)
    {
        while (!file_text_eof(_file))
        {
            var line = file_text_read_string(_file);
            l_arg = string_split(line, ",");
            
            if (array_length(l_arg) > 2)
            {
                AlbumArg[l_ind] = [l_arg[0], real(l_arg[1])];
                
                for (j = 2; j < array_length_1d(l_arg); j++)
                    array_push(AlbumArg[l_ind], real(l_arg[j]));
            }
            else
            {
                AlbumArg[l_ind] = [l_arg[0], real(l_arg[1])];
            }
            
            l_ind++;
            file_text_readln(_file);
        }
        
        file_text_close(_file);
    }
    
    _file = -1;
}

if (init == 0)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    customxy = 0;
    
    if (type == 1)
    {
        fusioncount = 0;
        scr_fusion_queue(1);
        scr_fusion_queue(2);
        scr_fusion_queue(3);
        scr_fusion_queue(4);
        scr_fusion_queue(5);
        scr_fusion_queue(6);
        menuMax = 2;
        menuHeight[0] = 2;
        menuWidth[0] = 1;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = fusioncount - 1;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 2;
        menuPageSize[0] = 2;
        menuScrollAdd[0] = menuPageSize[0];
        menuX[0] = xx + 80;
        menuY[0] = yy + 190;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 30;
        menuBoxDrawY1[0] = 130;
        menuBoxDrawX2[0] = 610;
        menuBoxDrawY2[0] = 406;
        menuSpacingX[0] = 0;
        menuSpacingY[0] = 113;
        menuHeaderTextAmount[0] = 2;
        menuHeaderText[0][0] = stringsetloc("Result", "obj_fusionmenu_slash_Step_0_gml_43_0");
        menuHeaderX[0][0] = ((xx + 120) - 20) + 14;
        menuHeaderY[0][0] = yy + 140;
        menuHeaderHeight[0][0] = 1;
        menuHeaderText[0][1] = stringsetloc("Ingredients", "obj_fusionmenu_slash_Step_0_gml_48_0");
        menuHeaderX[0][1] = (xx + 320 + 20) - 10;
        menuHeaderY[0][1] = yy + 140;
        menuHeaderHeight[0][1] = 1;
        wrap = 0;
        vwrap = 0;
        
        for (j = 0; j <= menuMaximumID[0]; j++)
        {
            optionID[0][j] = fusionResult[j];
            optionText[0][j] = fusionResultName[j];
            optionSelectable[0][j] = fusionCanMake[j];
            optionCommentA[0][j] = fusionIngredientName1[j];
            optionCommentAColor[0][j] = c_gray;
            
            if (fusionHaveIngredient1[j])
                optionCommentAColor[0][j] = c_white;
            
            optionCommentAWidth[0][j] = 250;
            optionCommentAXOffset[0][j] = 220;
            optionCommentAYOffset[0][j] = 0;
            optionCommentB[0][j] = fusionIngredientName2[j];
            optionCommentBColor[0][j] = c_gray;
            
            if (fusionHaveIngredient2[j])
                optionCommentBColor[0][j] = c_white;
            
            optionCommentBWidth[0][j] = 250;
            optionCommentBXOffset[0][j] = 220;
            optionCommentBYOffset[0][j] = 40;
            optionCommentC[0][j] = fusionDesc[j];
            optionCommentCColor[0][j] = c_black;
            optionCommentCWidth[0][j] = 160;
            optionCommentCXOffset[0][j] = 0;
            optionCommentCYOffset[0][j] = 40;
            optionTopComment[0][j] = fusionResultTopComment[j];
        }
        
        menuHeight[1] = 1;
        menuWidth[1] = 2;
        menuMinimumID[1] = 0;
        menuMaximumID[1] = 1;
        menuVEdgeBehavior[1] = 0;
        menuHEdgeBehavior[1] = 1;
        menuPageSize[1] = 2;
        menuX[1] = xx + 350;
        menuY[1] = yy + 400;
        menuBoxDraw[1] = 1;
        menuBoxDrawX1[1] = -10;
        menuBoxDrawY1[1] = 375;
        menuBoxDrawX2[1] = 650;
        menuBoxDrawY2[1] = 490;
        menuSpacingX[1] = 100;
        menuSpacingY[1] = 0;
        menuTextFont[0] = scr_84_get_font("mainbig");
        menuTextFont[1] = scr_84_get_font("mainbig");
        menuHeaderTextAmount[1] = 1;
        menuHeaderText[1][0] = stringsetloc("Really fuse it?", "obj_fusionmenu_slash_Step_0_gml_114_0");
        menuHeaderX[1][0] = xx + 60;
        menuHeaderY[1][0] = yy + 400;
        optionID[1][0] = 1;
        optionText[1][0] = stringsetloc("Yes", "obj_fusionmenu_slash_Step_0_gml_119_0");
        optionSelectable[1][0] = 1;
        optionEffect[1][0] = 1;
        optionID[1][1] = 1;
        optionText[1][1] = stringsetloc("No", "obj_fusionmenu_slash_Step_0_gml_124_0");
        optionSelectable[1][1] = 1;
        optionEffect[1][1] = 2;
    }
    
    if (type == 2)
    {
        dojoEncounter[0] = 178;
        dojoEncounter[1] = 0;
        dojoEncounter[2] = 0;
        dojoEncounter[3] = 0;
        dojoEncounter[4] = 0;
        dojoName[0] = stringsetloc("Lanino&Elnina", "obj_fusionmenu_slash_Step_0_gml_142_0_b");
        dojoName[1] = stringsetloc("-------------", "obj_fusionmenu_slash_Step_0_gml_143_0");
        dojoName[2] = stringsetloc("-------------", "obj_fusionmenu_slash_Step_0_gml_144_0_b");
        dojoName[3] = stringsetloc("-------------", "obj_fusionmenu_slash_Step_0_gml_145_0_b");
        dojoName[4] = stringsetloc("-------------", "obj_fusionmenu_slash_Step_0_gml_146_0_c");
        dojoTopComment[0] = stringsetloc("The weather always sticks together!#Predict the forecast and win!", "obj_fusionmenu_slash_Step_0_gml_148_0");
        dojoTopComment[1] = stringsetloc(" ", "obj_fusionmenu_slash_Step_0_gml_149_0");
        dojoTopComment[2] = stringsetloc(" ", "obj_fusionmenu_slash_Step_0_gml_150_0_b");
        dojoTopComment[3] = stringsetloc(" ", "obj_fusionmenu_slash_Step_0_gml_151_0_b");
        dojoTopComment[4] = stringsetloc(" ", "obj_fusionmenu_slash_Step_0_gml_152_0_b");
        dojoPrizeName[0] = stringsetloc("ExecBuffet", "obj_fusionmenu_slash_Step_0_gml_155_0");
        dojoPrizeName[1] = stringsetloc("---", "obj_fusionmenu_slash_Step_0_gml_156_0");
        dojoPrizeName[2] = stringsetloc("---", "obj_fusionmenu_slash_Step_0_gml_157_0");
        dojoPrizeName[3] = stringsetloc("---", "obj_fusionmenu_slash_Step_0_gml_158_0");
        dojoPrizeName[4] = stringsetloc("---", "obj_fusionmenu_slash_Step_0_gml_159_0");
        dojoPrizeValue[0] = 38;
        dojoPrizeValue[1] = 0;
        dojoPrizeValue[2] = 0;
        dojoPrizeValue[3] = 0;
        dojoPrizeValue[4] = 0;
        dojoPrizeType[0] = "item";
        dojoPrizeType[1] = "money";
        dojoPrizeType[2] = "item";
        dojoPrizeType[3] = "item";
        dojoPrizeType[4] = "item";
        dojoFlag[0] = 815;
        dojoFlag[1] = 0;
        dojoFlag[2] = 0;
        dojoFlag[3] = 0;
        dojoFlag[4] = 0;
        
        if (global.chapter == 2)
        {
            tasqueRecruited = global.flag[642];
            
            if (tasqueRecruited == 1)
            {
                dojoName[3] = stringsetloc("Tasque Manager Says", "obj_fusionmenu_slash_Step_0_gml_176_0");
                dojoPrizeName[3] = stringsetloc("$250", "obj_fusionmenu_slash_Step_0_gml_178_0");
                dojoTopComment[3] = stringsetloc("Winning's as easy as A-B-C!#You've got three chances, boss!", "obj_fusionmenu_slash_Step_0_gml_180_0");
                dojoEncounter[3] = 89;
            }
            
            if (ch2_allrecruited == 1)
            {
                dojoName[4] = stringsetloc("Ch2 All Stars", "obj_fusionmenu_slash_Step_0_gml_177_0");
                dojoPrizeName[4] = stringsetloc("TensionGem", "obj_fusionmenu_slash_Step_0_gml_179_0");
                dojoTopComment[4] = stringsetloc("Face everyone in a row!#It'll take some stamina...", "obj_fusionmenu_slash_Step_0_gml_181_0");
                dojoEncounter[4] = 90;
            }
        }
        
        dojoEncounterAmbush[0] = 0;
        dojoEncounterAmbush[1] = 1;
        dojoEncounterAmbush[2] = 0;
        dojoEncounterAmbush[3] = 1;
        dojoEncounterAmbush[4] = 0;
        stringClaimed = stringsetloc("Claimed", "obj_fusionmenu_slash_Step_0_gml_208_0");
        
        if (global.flag[815] != 0)
            dojoPrizeName[0] = stringClaimed;
        
        menuMax = 2;
        menuHeight[0] = 5;
        menuWidth[0] = 1;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = 4;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 0;
        menuPageSize[0] = 5;
        menuScrollAdd[0] = menuPageSize[0];
        menuX[0] = (xx + 129) - 15 - 15;
        menuY[0] = (yy + 220) - 5;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 60;
        menuBoxDrawY1[0] = 158;
        menuBoxDrawX2[0] = 580;
        menuBoxDrawY2[0] = 434;
        menuSpacingX[0] = 0;
        menuSpacingY[0] = 44;
        menuTextXScale[0] = 150;
        menuHeaderTextAmount[0] = 2;
        menuHeaderText[0][0] = stringsetloc("Challenge", "obj_fusionmenu_slash_Step_0_gml_215_0");
        menuHeaderX[0][0] = (xx + 120 + 30) - 21;
        menuHeaderY[0][0] = ((yy + 200) - 5 - 10 - 10 - 10) + 2;
        menuHeaderHeight[0][0] = 1;
        menuHeaderColor[0][0] = c_gray;
        menuHeaderText[0][1] = stringsetloc("Prize", "obj_fusionmenu_slash_Step_0_gml_220_0");
        menuHeaderX[0][1] = (xx + 320 + 30) - 21;
        menuHeaderY[0][1] = ((yy + 200) - 5 - 10 - 10 - 10) + 2;
        menuHeaderHeight[0][1] = 1;
        menuHeaderColor[0][1] = c_gray;
        wrap = 0;
        vwrap = 0;
        
        for (j = 0; j <= menuMaximumID[0]; j++)
        {
            optionID[0][j] = 6;
            optionText[0][j] = dojoName[j];
            optionSelectable[0][j] = 0;
            
            if (dojoEncounter[j] > 0)
                optionSelectable[0][j] = 1;
            
            optionCommentA[0][j] = dojoPrizeName[j];
            optionCommentAWidth[0][j] = 200;
            optionCommentAXOffset[0][j] = 200;
            optionCommentAYOffset[0][j] = 0;
            optionCommentAColor[0][j] = c_white;
            
            if (global.flag[dojoFlag[j]] >= 1)
            {
                optionCommentAColor[0][j] = c_yellow;
                optionCommentA[0][j] += stringsetloc("!", "obj_fusionmenu_slash_Step_0_gml_244_0");
            }
            
            optionTopComment[0][j] = dojoTopComment[j];
        }
        
        menuHeight[1] = 1;
        menuWidth[1] = 2;
        menuMinimumID[1] = 0;
        menuMaximumID[1] = 1;
        menuVEdgeBehavior[1] = 0;
        menuHEdgeBehavior[1] = 1;
        menuPageSize[1] = 2;
        menuX[1] = xx + 350;
        menuY[1] = yy + 400;
        menuBoxDraw[1] = 1;
        menuBoxDrawX1[1] = -10;
        menuBoxDrawY1[1] = 375;
        menuBoxDrawX2[1] = 650;
        menuBoxDrawY2[1] = 490;
        menuSpacingX[1] = 100;
        menuSpacingY[1] = 0;
        menuHeaderTextAmount[1] = 1;
        menuHeaderText[1][0] = stringsetloc("Challenge?", "obj_fusionmenu_slash_Step_0_gml_275_0");
        menuHeaderX[1][0] = xx + 60;
        menuHeaderY[1][0] = yy + 400;
        optionID[1][0] = 1;
        optionText[1][0] = stringsetloc("Yes", "obj_fusionmenu_slash_Step_0_gml_280_0");
        optionSelectable[1][0] = 1;
        optionEffect[1][0] = 1;
        optionID[1][1] = 1;
        optionText[1][1] = stringsetloc("No", "obj_fusionmenu_slash_Step_0_gml_285_0");
        optionSelectable[1][1] = 1;
        optionEffect[1][1] = 2;
    }
    
    if (type == 3)
    {
        if (subtype == 2 || subtype == 1)
        {
            if (subtype == 1)
                scr_recruit_info_all("total");
            
            if (subtype == 2)
                scr_recruit_info_all("either");
            
            alternateMenu = 1;
        }
        else
        {
            alternateMenu = 0;
            scr_recruit_info_all("total");
        }
        
        menuMax = 3;
        menuWidth[0] = 1;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = allrecruits - 1;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 2;
        menuHeight[0] = min(menuMaximumID[0] + 1, 9);
        menuPageSize[0] = menuHeight[0];
        
        if (menuMaximumID[0] < menuPageSize[0])
            menuHEdgeBehavior[0] = 0;
        
        menuScrollAdd[0] = menuPageSize[0];
        menuNext[0] = 1;
        menuX[0] = xx + 50;
        menuY[0] = yy + 90;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 30;
        menuBoxDrawY1[0] = 10;
        menuBoxDrawX2[0] = 300;
        
        if (alternateMenu == 1)
            menuBoxDrawX2[0] = 620;
        
        menuBoxDrawY2[0] = 440;
        menuSpacingX[0] = 0;
        menuSpacingY[0] = 35;
        menuTextXScale[0] = 180;
        menuTextYScale[0] = 1;
        menuTextOffsetY[0] = 2;
        menuDisplayCondition[0] = 1;
        menuWidth[1] = 1;
        menuHeight[1] = 1;
        menuBoxDraw[1] = 1;
        menuBoxDrawX1[1] = 30;
        menuBoxDrawY1[1] = 10;
        menuBoxDrawX2[1] = 610;
        menuBoxDrawY2[1] = 450;
        menuX[1] = xx + 50;
        menuY[1] = yy + 400;
        menuSpacingY[1] = 0;
        menuMaximumID[1] = menuMaximumID[0];
        menuVEdgeBehavior[1] = 0;
        menuHEdgeBehavior[1] = 2;
        menuPageSize[1] = 1;
        menuScrollAdd[1] = menuPageSize[1];
        menuDisplayCondition[1] = 1;
        
        for (j = 0; j <= menuMaximumID[1]; j++)
        {
            optionText[0][j] = recruitName[j];
            optionText[1][j] = " ";
            optionSelectable[0][j] = 1;
            optionSelectable[1][j] = recruitPlaceable[j];
            
            if (recruitPlaceable[j] == 2)
            {
                var _is_seated = false;
                _seatcheck = recruitID[j];
                
                for (var i = 0; i < instance_number(obj_npc_cafe); i++)
                {
                    var patron = instance_find(obj_npc_cafe, i);
                    
                    if (patron.myid == _seatcheck)
                    {
                        _is_seated = true;
                        break;
                    }
                }
                
                if (_is_seated)
                {
                    recruitPlaceable[j] = 0;
                    optionSelectable[1][j] = 0;
                }
            }
            
            if (alternateMenu)
            {
                optionSelectable[0][j] = 1;
                optionSelectable[1][j] = 0;
                
                if (recruitFullyRecruited[j] == 1)
                {
                    optionCommentA[0][j] = stringsetloc("Recruited!", "obj_fusionmenu_slash_Step_0_gml_377_0");
                    optionCommentAColor[0][j] = c_lime;
                    optionCommentAXOffset[0][j] = 195;
                    optionCommentAYOffset[0][j] = 0;
                    optionCommentAWidth[0][j] = squished;
                }
                else
                {
                    optionCommentAColor[0][j] = c_ltgray;
                    optionCommentAXOffset[0][j] = 200;
                    optionCommentAYOffset[0][j] = 0;
                    optionCommentAWidth[0][j] = 1;
                    optionCommentA[0][j] = string(recruitCountCurrent[j]) + "/" + string(recruitCountMax[j]);
                }
            }
        }
        
        menuWidth[2] = 4;
        menuHeight[2] = 1;
        menuBoxDraw[2] = 0;
        menuX[2] = xx + 50;
        menuY[2] = yy + 300;
        menuSpacingY[2] = 0;
        menuMaximumID[2] = 3;
        menuVEdgeBehavior[2] = 0;
        menuHEdgeBehavior[2] = 1;
        menuDisplayCondition[2] = 1;
        customxy = 1;
        scr_custommenu_optionxy();
        menuSpacingOverride[2] = 1;
        _n = 2;
        var _seatcheck = 0;
        
        if (alternateMenu == 0)
        {
            for (j = 0; j < 4; j++)
            {
                _seatcheck = j;
                
                with (obj_npc_cafe)
                {
                    if (_seatcheck == seat)
                        obj_fusionmenu.cafenpc[_seatcheck] = id;
                }
                
                optionX[_n][j] = cafenpc[j].x + 40;
                optionY[_n][j] = cafenpc[j].y + 35;
                optionText[_n][j] = " ";
                
                if (global.is_console || obj_gamecontroller.gamepad_active)
                {
                    optionTopComment[_n][j] = stringsetloc("      Place                 Return", "obj_fusionmenu_slash_Step_0_gml_462_0");
                    display_buttons = true;
                }
                else
                {
                    optionTopComment[_n][j] = stringsetsubloc("~1: Place   ~2: Return", scr_get_input_name(4), scr_get_input_name(5), "obj_fusionmenu_slash_Step_0_gml_434_0");
                }
                
                optionSelectable[_n][j] = 1;
                optionEffect[_n][j] = 1;
            }
        }
    }
    
    if (type == 4)
    {
        depth = -40000;
        scr_custommenu_item_info_refresh();
        wrap = 0;
        vwrap = 0;
        menuMax = 2;
        menuSprite = spr_heartsmall;
        menuHeight[0] = 6;
        menuWidth[0] = 2;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = 11;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 1;
        menuPageSize[0] = 12;
        menuScrollAdd[0] = menuPageSize[0];
        menuX[0] = xx + 140;
        
        if (jp)
            menuX[0] = xx + 160;
        
        menuY[0] = yy + 140;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 40;
        menuBoxDrawY1[0] = 120;
        menuBoxDrawX2[0] = 600;
        menuBoxDrawY2[0] = 280;
        menuSpacingX[0] = 220;
        
        if (jp)
            menuSpacingX[0] = 180;
        
        menuSpacingY[0] = 20;
        menuTextOffsetX[0] = 14;
        menuTextOffsetY[0] = 4;
        menuTextOffsetX[1] = 14;
        menuTextOffsetY[1] = 4;
        menuTextScaleType[0] = 1;
        menuTextXScale[0] = 0.5;
        menuTextScaleType[1] = 1;
        menuTextYScale[1] = 0.5;
        menuDisplayCondition[1] = 0;
        menuHeight[1] = 6;
        menuWidth[1] = 2;
        menuMinimumID[1] = 0;
        menuMaximumID[1] = global.flag[64] - 1;
        menuVEdgeBehavior[1] = 1;
        menuHEdgeBehavior[1] = 2;
        menuPageSize[1] = 12;
        menuScrollAdd[1] = menuPageSize[1];
        menuX[1] = xx + 140;
        
        if (jp)
            menuX[1] = xx + 110;
        
        menuY[1] = yy + 290;
        menuBoxDraw[1] = 1;
        menuBoxDrawX1[1] = 40;
        menuBoxDrawY1[1] = 275;
        menuBoxDrawX2[1] = 600;
        menuBoxDrawY2[1] = 430;
        menuSpacingX[1] = 220;
        
        if (global.lang == "ja")
            menuSpacingX[1] = xx + 240;
        
        menuSpacingY[1] = 20;
        
        if (jp)
        {
            menuTextScaleType[0] = 1;
            menuTextScaleType[1] = 1;
            menuTextXScale[0] = 1;
            menuTextYScale[0] = 1;
            menuTextXScale[1] = 1;
            menuTextYScale[1] = 1;
            menuTextFont[0] = scr_84_get_font("dotumche");
            menuTextFont[1] = scr_84_get_font("dotumche");
            menuTextXScale[0] = 1;
            menuTextYScale[0] = 1;
            menuTextXScale[1] = 1;
            menuTextYScale[1] = 1;
            menuTextFont[0] = 18;
            menuTextFont[1] = 18;
            menuTextScaleType[1] = 1;
            menuX[1] = xx + 160;
            menuSpacingX[1] = 180;
        }
        else
        {
            menuTextScaleType[0] = 1;
            menuTextScaleType[1] = 1;
            menuTextXScale[0] = 1;
            menuTextYScale[0] = 1;
            menuTextXScale[1] = 1;
            menuTextYScale[1] = 1;
            menuTextFont[0] = scr_84_get_font("dotumche");
            menuTextFont[1] = scr_84_get_font("dotumche");
        }
    }
    
    if (type == 5)
    {
        menuMax = 1;
        menuHeight[0] = 6;
        menuWidth[0] = 1;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = 0;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 2;
        menuPageSize[0] = 6;
        menuScrollAdd[0] = 6;
        songCount = 0;
        songPlaying = " ";
        songPlayingName = " ";
        chosenSongName = " ";
        tickerTimer = 0;
        scr_musicmenu_songadd("castletown.ogg", stringsetloc("My Castle", "obj_fusionmenu_slash_Step_0_gml_568_0"));
        scr_musicmenu_songadd("cyber.ogg", stringsetloc("A CYBER'S WORLD?", "obj_fusionmenu_slash_Step_0_gml_569_0"));
        scr_musicmenu_songadd("cyberhouse.ogg", stringsetloc("Mini Studio", "obj_fusionmenu_slash_Step_0_gml_570_0"));
        scr_musicmenu_songadd("cyber_shop.ogg", stringsetloc("Sound Studio", "obj_fusionmenu_slash_Step_0_gml_571_0"));
        scr_musicmenu_songadd("cybershop_christmas.ogg", stringsetloc("Holiday Studio", "obj_fusionmenu_slash_Step_0_gml_572_0"));
        scr_musicmenu_songadd("cybercity.ogg", stringsetloc("Welcome To The City", "obj_fusionmenu_slash_Step_0_gml_573_0"));
        scr_musicmenu_songadd("acid_tunnel.ogg", stringsetloc("Acid Tunnel of Love", "obj_fusionmenu_slash_Step_0_gml_574_0"));
        scr_musicmenu_songadd("battle.ogg", stringsetloc("Rude Buster", "obj_fusionmenu_slash_Step_0_gml_575_0"));
        scr_musicmenu_songadd("berdly_chase.ogg", stringsetloc("Smart Race", "obj_fusionmenu_slash_Step_0_gml_576_0"));
        scr_musicmenu_songadd("coolbeat.ogg", stringsetloc("Cool Beat", "obj_fusionmenu_slash_Step_0_gml_577_0"));
        scr_musicmenu_songadd("hip_shop.ogg", stringsetloc("Hip Shop", "obj_fusionmenu_slash_Step_0_gml_578_0"));
        scr_musicmenu_songadd("lancer.ogg", stringsetloc("I'm The Bad Guy!", "obj_fusionmenu_slash_Step_0_gml_579_0"));
        scr_musicmenu_songadd("mansion.ogg", stringsetloc("Pandora Palace", "obj_fusionmenu_slash_Step_0_gml_580_0"));
        scr_musicmenu_songadd("queen.ogg", stringsetloc("Queen", "obj_fusionmenu_slash_Step_0_gml_581_0"));
        scr_musicmenu_songadd("queen_car_radio.ogg", stringsetloc("Cool Mixtape", "obj_fusionmenu_slash_Step_0_gml_582_0"));
        scr_musicmenu_songadd("ruruskaado.ogg", stringsetloc("Rouxls Kaard", "obj_fusionmenu_slash_Step_0_gml_583_0"));
        scr_musicmenu_songadd("rouxls_battle.ogg", stringsetloc("It's Pronounced \"Rules\"", "obj_fusionmenu_slash_Step_0_gml_584_0"));
        scr_musicmenu_songadd("shop1.ogg", stringsetloc("Lantern", "obj_fusionmenu_slash_Step_0_gml_585_0"));
        menuMaximumID[0] = songCount - 1;
        menuX[0] = xx + 40;
        menuY[0] = yy + 260;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 10;
        menuBoxDrawY1[0] = 250;
        menuBoxDrawX2[0] = 630;
        menuBoxDrawY2[0] = 470;
        menuSpacingX[0] = 0;
        menuSpacingY[0] = 34;
        menuTextXScale[0] = 320;
        menuHeaderTextAmount[0] = 0;
        wrap = 0;
        vwrap = 0;
        
        for (j = 0; j < songCount; j++)
        {
            optionID[0][j] = songOgg[j];
            optionText[0][j] = songName[j];
            optionSelectable[0][j] = 1;
            optionEffect[0][j] = 1;
        }
    }
    
    if (type == 6)
    {
        alternateMenu = 0;
        dojoFlag[0] = -1;
        var song_id = "";
        
        with (obj_room_castle_tv_rhythm)
            song_id = selected_song_id;
        
        var track_names = scr_rhythmgame_songlist();
        var song_name = track_names[song_id];
        menuMax = 2;
        menuHeight[0] = 5;
        menuWidth[0] = 1;
        menuMinimumID[0] = 0;
        menuMaximumID[0] = 0;
        menuVEdgeBehavior[0] = 1;
        menuHEdgeBehavior[0] = 2;
        menuPageSize[0] = 5;
        menuScrollAdd[0] = 5;
        menuHeight[1] = 5;
        menuWidth[1] = 1;
        menuMinimumID[1] = 0;
        menuMaximumID[1] = 0;
        menuVEdgeBehavior[1] = 1;
        menuHEdgeBehavior[1] = 2;
        menuPageSize[1] = 5;
        menuScrollAdd[1] = 5;
        songCount = 0;
        songPlaying = " ";
        songPlayingName = " ";
        chosenSongName = " ";
        tickerTimer = 0;
        menuCoord[2] = 0;
        
        if (i_ex(obj_room_castle_tv_rhythm))
        {
            if (obj_room_castle_tv_rhythm.AllSongsLoaded == 0)
            {
                for (var i = 0; i < array_length_1d(track_names); i++)
                {
                    var song_preview = " ";
                    
                    with (obj_room_castle_tv_rhythm)
                    {
                        scr_rhythmgame_song_select(i);
                        song_preview = alt_preview;
                    }
                    
                    if (song_preview != " ")
                        scr_musicmenu_songadd(song_preview, track_names[i]);
                }
                
                obj_room_castle_tv_rhythm.AllSongsLoaded = 0;
            }
            else
            {
                songCount = array_length_1d(track_names);
                songOgg = obj_room_castle_tv_rhythm.MemorySongOgg;
                songName = obj_room_castle_tv_rhythm.MemorySongName;
            }
        }
        
        menuMaximumID[1] = songCount - 1;
        menuX[1] = xx + 40;
        menuY[1] = yy + 260;
        menuBoxDraw[1] = 1;
        menuBoxDrawX1[1] = 10;
        menuBoxDrawY1[1] = 250;
        menuBoxDrawX2[1] = 630;
        menuBoxDrawY2[1] = 470;
        menuSpacingX[1] = 0;
        menuSpacingY[1] = 34;
        menuTextXScale[1] = 320;
        menuHeaderTextAmount[1] = 0;
        menuMaximumID[0] = songCount - 1;
        menuX[0] = xx + 40;
        menuY[0] = yy + 260;
        menuBoxDraw[0] = 1;
        menuBoxDrawX1[0] = 10;
        menuBoxDrawY1[0] = 250;
        menuBoxDrawX2[0] = 630;
        menuBoxDrawY2[0] = 470;
        menuSpacingX[0] = 0;
        menuSpacingY[0] = 34;
        menuTextXScale[0] = 320;
        menuHeaderTextAmount[0] = 0;
        wrap = 0;
        vwrap = 0;
        menuCoord[3] = songCount;
        
        for (j = 0; j < songCount; j++)
        {
            optionID[1][j] = songOgg[j];
            optionText[1][j] = songName[j];
            optionSelectable[1][j] = 1;
            optionEffect[1][j] = 1;
            dojoEncounter[j] = j;
        }
        
        if (!file_exists("SongCharts/AlbumsInfo.txt"))
        {
            menu = 1;
            
            for (j = 0; j < songCount; j++)
            {
                optionID[0][j] = songOgg[j];
                optionText[0][j] = songName[j];
                optionSelectable[0][j] = 1;
                optionEffect[0][j] = 1;
            }
            
            with (obj_room_castle_tv_rhythm)
                show_scroller();
            
            heartX = menuX[1];
            heartY = menuY[1];
        }
        else
        {
            menu = 0;
            menuMaximumID[0] = array_length(AlbumArg) - 1;
            
            for (j = 0; j < array_length(AlbumArg); j++)
            {
                optionID[0][j] = 0;
                optionText[0][j] = string("* " + AlbumArg[j][0]);
                optionSelectable[0][j] = 1;
                optionEffect[0][j] = 1;
            }
            
            heartX = menuX[0];
            heartY = menuY[0];
        }
    }
    
    if (customxy == 0)
        scr_custommenu_optionxy();
    
    heartX = menuX[0];
    heartY = menuY[0];
    init = 1;
}

event_inherited();

if (type == 1)
{
    if (menu == 1 && menuCoord[menu] == 0 && confirm_custom == 1)
    {
        scr_itemremove_anytype(fusionIngredient1[menuCoord[0]], fusionIngredientType1[menuCoord[0]]);
        scr_itemremove_anytype(fusionIngredient2[menuCoord[0]], fusionIngredientType2[menuCoord[0]]);
        scr_itemget_anytype(fusionResult[menuCoord[0]], fusionResultType[menuCoord[0]]);
        snd_play(snd_select);
        
        if (instance_exists(obj_npc_hammerguy))
        {
            obj_npc_hammerguy.con = 70;
            obj_npc_hammerguy.fusionResultName = fusionResultName[menuCoord[0]];
            obj_npc_hammerguy.fusionResultType = fusionResultType[menuCoord[0]];
            
            if (fusionIngredientType1[menuCoord[0]] == "armor")
                obj_npc_hammerguy.item1 = 0;
            else if (fusionIngredientType1[menuCoord[0]] == "weapon")
                obj_npc_hammerguy.item1 = 1;
            else
                obj_npc_hammerguy.item1 = 2;
            
            if (fusionIngredientType2[menuCoord[0]] == "armor")
                obj_npc_hammerguy.item2 = 0;
            else if (fusionIngredientType2[menuCoord[0]] == "weapon")
                obj_npc_hammerguy.item2 = 1;
            else
                obj_npc_hammerguy.item2 = 2;
            
            if (fusionResultType[menuCoord[0]] == "armor")
                obj_npc_hammerguy.item3 = 0;
            else if (fusionResultType[menuCoord[0]] == "weapon")
                obj_npc_hammerguy.item3 = 1;
            else
                obj_npc_hammerguy.item3 = 2;
        }
        
        instance_destroy();
    }
}

if (type == 2)
{
    if (menu == 1 && menuCoord[menu] == 0 && confirm_custom == 1)
    {
        global.ambush = dojoEncounterAmbush[menuCoord[0]];
        global.encounterno = dojoEncounter[menuCoord[0]];
        global.flag[35] = 1;
        global.flag[37] = 1;
        global.flag[38] = 1;
        global.flag[61] = 1;
        scr_battle(global.encounterno, 3, 0, 0, 0);
        
        with (obj_npc_dojo)
            con = 10;
        
        if (instance_exists(obj_npc_dojo))
        {
            obj_npc_dojo.dojoPrizeValue = dojoPrizeValue[menuCoord[0]];
            obj_npc_dojo.dojoPrizeType = dojoPrizeType[menuCoord[0]];
            obj_npc_dojo.dojoFlag = dojoFlag[menuCoord[0]];
            obj_npc_dojo.dojoPrizeName = dojoPrizeName[menuCoord[0]];
        }
        
        instance_destroy();
    }
}

if (type == 3)
{
    if (confirm_moved == 1 && menu == 1)
    {
        menuCoord[1] = menuCoord[0];
        menuScrollCurrent[1] = menuCoord[1];
    }
    
    if (cancel_press == 1 && menu == 0 && i_ex(id))
    {
        menuCoord[0] = menuCoord[1];
        menuScrollCurrent[0] = floor(menuCoord[0] / menuPageSize[0]) * menuPageSize[0];
    }
    
    if (cancel_press == 1 && menu == 1)
    {
        with (obj_npc_cafe)
        {
            mode = 0;
            fsiner = 0;
            _sprite = remsprite;
        }
    }
    
    if (menu == 2)
    {
        with (obj_npc_cafe)
        {
            mode = 0;
            _sprite = remsprite;
        }
        
        cafenpc[menuCoord[2]].mode = 1;
        cafenpc[menuCoord[2]]._sprite = recruitSprite[menuCoord[1]];
        
        if (confirm_custom == 1)
        {
            global.flag[800 + menuCoord[2]] = recruitID[menuCoord[1]];
            
            with (obj_npc_cafe)
                event_user(6);
            
            snd_play(snd_select);
            
            with (obj_npc_cafe)
            {
                mode = 0;
                fsiner = 0;
                _sprite = remsprite;
            }
            
            scr_recruit_info_all("total");
            
            for (j = 0; j <= menuMaximumID[1]; j++)
            {
                if (recruitPlaceable[j] == 2)
                {
                    var _is_seated = false;
                    var _seatcheck = recruitID[j];
                    
                    for (var i = 0; i < instance_number(obj_npc_cafe); i++)
                    {
                        var patron = instance_find(obj_npc_cafe, i);
                        
                        if (patron.myid == _seatcheck)
                        {
                            _is_seated = true;
                            break;
                        }
                    }
                    
                    if (_is_seated)
                    {
                        recruitPlaceable[j] = 0;
                        optionSelectable[1][j] = 0;
                    }
                    else
                    {
                        recruitPlaceable[j] = 1;
                        optionSelectable[1][j] = 1;
                    }
                }
            }
            
            menu = 1;
        }
    }
}

if (type == 4)
{
    if (menu == 1)
    {
        if (confirm_custom == 1)
        {
            var swapItemId = menuitemid[menuCoord[0]];
            var swapItemDesc = menuitemdesc[menuCoord[0]];
            var swapItemName = menuitemname[menuCoord[0]];
            var swapPocketId = pocketitemid[menuCoord[1]];
            var swapPocketDesc = pocketitemdesc[menuCoord[1]];
            var swapPocketName = pocketitemname[menuCoord[1]];
            
            if (swapPocketId > 0 && swapItemId > 0)
            {
                global.item[menuCoord[0]] = swapPocketId;
                global.pocketitem[menuCoord[1]] = swapItemId;
                optionID[0][menuCoord[0]] = swapPocketId;
                optionText[0][menuCoord[0]] = swapPocketName;
                optionTopComment[0][menuCoord[0]] = swapPocketDesc;
                optionID[1][menuCoord[1]] = swapItemId;
                optionText[1][menuCoord[1]] = swapItemName;
                optionTopComment[1][menuCoord[1]] = swapItemDesc;
                menuitemid[menuCoord[0]] = swapPocketId;
                menuitemdesc[menuCoord[0]] = swapPocketDesc;
                menuitemname[menuCoord[0]] = swapPocketName;
                pocketitemid[menuCoord[1]] = swapItemId;
                pocketitemdesc[menuCoord[1]] = swapItemDesc;
                pocketitemname[menuCoord[1]] = swapItemName;
            }
            else if (swapPocketId <= 0 && swapItemId > 0)
            {
                scr_itemshift(menuCoord[0], 0);
                global.pocketitem[menuCoord[1]] = swapItemId;
                scr_custommenu_item_info_refresh();
            }
            else if (swapPocketId > 0 && swapItemId <= 0)
            {
                scr_itemget(swapPocketId);
                global.pocketitem[menuCoord[1]] = 0;
                scr_custommenu_item_info_refresh();
            }
            
            snd_play(snd_select);
            optionSelected[0][menuCoord[0]] = 0;
            optionSelected[1][menuCoord[1]] = 0;
            menu = 0;
        }
    }
}

if (type == 5)
{
    if (confirm_custom == 1)
    {
        tickerTimer = 0;
        snd_free_all();
        mus_initloop(songOgg[menuCoord[0]]);
        songPlaying = songOgg[menuCoord[0]];
        songPlayingName = songName[menuCoord[0]];
        chosenSongName = songPlayingName;
        
        if (subtype == 1)
            global.tempflag[11] = songPlaying;
    }
    
    for (j = 0; j < songCount; j++)
    {
        if (songPlaying == songOgg[j])
            optionSelected[0][j] = 1;
        else
            optionSelected[0][j] = 0;
    }
}

if (type == 6)
{
    if (menu == 0)
    {
        if (confirm_custom == 1)
        {
            menuCoord[2] = 0;
            songCount = menuCoord[3];
            
            for (j = 0; j < array_length_1d(songOgg); j++)
            {
                dojoEncounter[j] = 0;
                var Extend = j + 5;
                
                if (j < AlbumArg[menuCoord[0]][1] && AlbumArg[menuCoord[0]][1] > -1)
                {
                    optionID[1][j] = songOgg[AlbumArg[menuCoord[0]][j + 2] - 1];
                    optionText[1][j] = songName[AlbumArg[menuCoord[0]][j + 2] - 1];
                    optionSelectable[1][j] = 1;
                    optionEffect[1][j] = 1;
                    dojoEncounter[j] = AlbumArg[menuCoord[0]][j + 2] - 1;
                }
                else if (AlbumArg[menuCoord[0]][1] == -1)
                {
                    optionID[1][j] = songOgg[j];
                    optionText[1][j] = songName[j];
                    optionSelectable[1][j] = 1;
                    optionEffect[1][j] = 1;
                    dojoEncounter[j] = j;
                }
                else if (AlbumArg[menuCoord[0]][1] == -2 && Extend < array_length_1d(songOgg))
                {
                    optionID[1][j] = songOgg[Extend];
                    optionText[1][j] = songName[Extend];
                    optionSelectable[1][j] = 1;
                    optionEffect[1][j] = 1;
                    dojoEncounter[j] = Extend;
                }
                else
                {
                    optionID[1][j] = "";
                    optionText[1][j] = "";
                    optionSelectable[1][j] = 0;
                    optionEffect[1][j] = 0;
                }
            }
            
            if (AlbumArg[menuCoord[0]][1] > -1)
                songCount = AlbumArg[menuCoord[0]][1];
            else if (AlbumArg[menuCoord[0]][1] == -2)
                songCount = array_length_1d(songOgg) - 5;
            else
                songCount = array_length_1d(songOgg);
            
            menuMaximumID[1] = songCount - 1;
            menuCoord[0] = menuCoord[1];
            menuScrollCurrent[0] = menuCoord[1];
            snd_play(snd_select);
            
            with (obj_room_castle_tv_rhythm)
                show_scroller();
            
            confirm_custom = 0;
            menu = 1;
        }
        
        if (cancel_press == 1)
        {
            menuCoord[0] = menuCoord[1];
            menuScrollCurrent[0] = floor(menuCoord[0] / menuPageSize[0]) * menuPageSize[0];
            
            with (obj_room_castle_tv_rhythm)
                scroller.hide_banner();
            
            endme = 1;
            global.interact = 0;
            instance_destroy();
        }
    }
    
    if (menu == 1)
    {
        if (songPlayingName != songName[dojoEncounter[menuCoord[1]]])
        {
            tickerTimer = 0;
            snd_free_all();
            songPlaying = songOgg[dojoEncounter[menuCoord[1]]];
            songPlayingName = songName[dojoEncounter[menuCoord[1]]];
            chosenSongName = songPlayingName;
            var ChosenID = dojoEncounter[menuCoord[1]];
            var previewLoc = dojoName[ChosenID];
            var ChatIsThisTrue = 0;
            
            with (obj_room_castle_tv_rhythm)
            {
                scr_rhythmgame_song_select(ChosenID);
                selected_song_id = ChosenID;
                
                if (selected_song_id >= 2 && selected_song_id <= 4)
                {
                    local_preview = previewLoc;
                    ChatIsThisTrue = 1;
                }
                else
                {
                    local_preview = snd_init(previewLoc);
                }
                
                update_scroller();
            }
            
            with (obj_dw_rhythm_speakers)
            {
                clean_up();
                
                if (ChatIsThisTrue == 1)
                    update_song(previewLoc);
                else
                    update_song(snd_init(previewLoc));
            }
            
            if (subtype == 1)
                global.tempflag[11] = songPlaying;
        }
        
        if (confirm_custom == 1 || button3_p())
        {
            var ChosenID = dojoFlag[dojoEncounter[menuCoord[1]]];
            
            if (confirm_custom == 1)
                global.band_difficulty = 0;
            else
                global.band_difficulty = 1;
            
            with (obj_room_castle_tv_rhythm)
            {
                scr_rhythmgame_song_select(ChosenID);
                selected_song_id = ChosenID;
                scroller.hide_banner();
                actually_play();
            }
            
            snd_free_all();
            endme = 1;
            global.interact = 0;
            instance_destroy();
        }
        
        if (button2_p() && file_exists("SongCharts/AlbumsInfo.txt"))
        {
            menuCoord[1] = menuCoord[0];
            menuScrollCurrent[1] = floor(menuCoord[1] / menuPageSize[1]) * menuPageSize[1];
            
            with (obj_room_castle_tv_rhythm)
                scroller.hide_banner();
            
            menuCoord[2] = 0;
            menu = 0;
        }
        
        if (button2_p() && !file_exists("SongCharts/AlbumsInfo.txt"))
        {
            menuCoord[0] = menuCoord[1];
            menuScrollCurrent[0] = floor(menuCoord[0] / menuPageSize[0]) * menuPageSize[0];
            
            with (obj_room_castle_tv_rhythm)
                scroller.hide_banner();
            
            endme = 1;
            global.interact = 0;
            instance_destroy();
        }
        
        for (j = 0; j < songCount; j++)
        {
            if (songPlaying == songOgg[j])
                optionSelected[1][j] = 1;
            else
                optionSelected[1][j] = 0;
        }
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
