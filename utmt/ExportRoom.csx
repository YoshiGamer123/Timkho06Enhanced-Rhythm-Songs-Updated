// Written by SolventMercury - Modified to Export Rooms
// Converted Import script to Export script

using System;
using System.IO;
using System.Text;
using System.Text.Json;
using UndertaleModLib.Util;
using UndertaleModLib.Models;
using System.Collections;
using System.Collections.Generic;
using System.Text.Json;
using System.Linq;

EnsureDataLoaded();

ScriptMessage("Select the Room to export");
string roomName = SimpleTextInput("Room name", "Enter the room name to export", "", false);
UndertaleRoom roomToExport = Data.Rooms.ByName(roomName);
if (roomToExport == null) 
{
    ScriptError("Room not found!");
    return;
}

string exportPath = PromptChooseDirectory();
if (exportPath == null) throw new ScriptException("Export path was not set.");

string fileName = Path.Combine(exportPath, roomToExport.Name.Content + ".json");

ExportRoom(roomToExport, fileName);
ScriptMessage($"Room exported to: {fileName}");

void ExportRoom(UndertaleRoom room, string filePath)
{
    var options = new JsonWriterOptions
    {
        Indented = true
    };

    using FileStream stream = File.Create(filePath);
    using Utf8JsonWriter writer = new Utf8JsonWriter(stream, options);

    writer.WriteStartObject();

    // Write basic room properties
    writer.WriteString("name", room.Name?.Content);
    writer.WriteString("caption", room.Caption?.Content);
    writer.WriteNumber("width", room.Width);
    writer.WriteNumber("height", room.Height);
    writer.WriteNumber("speed", room.Speed);
    writer.WriteBoolean("persistent", room.Persistent);
    writer.WriteNumber("background_color", room.BackgroundColor & 0x00FFFFFF); // Remove alpha
    writer.WriteBoolean("draw_background_color", room.DrawBackgroundColor);
    writer.WriteString("creation_code_id", room.CreationCodeId?.Name?.Content);
    writer.WriteNumber("flags", (long)room.Flags);
    writer.WriteBoolean("world", room.World);
    writer.WriteNumber("top", room.Top);
    writer.WriteNumber("left", room.Left);
    writer.WriteNumber("right", room.Right);
    writer.WriteNumber("bottom", room.Bottom);
    writer.WriteNumber("gravity_x", room.GravityX);
    writer.WriteNumber("gravity_y", room.GravityY);
    writer.WriteNumber("meters_per_pixel", room.MetersPerPixel);

    // Write backgrounds
    WriteBackgrounds(writer, room);

    // Write views
    WriteViews(writer, room);

    // Write game objects
    WriteGameObjects(writer, room);

    // Write tiles
    WriteTiles(writer, room);

    // Write layers
    WriteLayers(writer, room);

    writer.WriteEndObject();
}

void WriteBackgrounds(Utf8JsonWriter writer, UndertaleRoom room)
{
    writer.WriteStartArray("backgrounds");
    
    foreach (var bg in room.Backgrounds)
    {
        writer.WriteStartObject();
        writer.WriteBoolean("enabled", bg.Enabled);
        writer.WriteBoolean("foreground", bg.Foreground);
        writer.WriteString("background_definition", bg.BackgroundDefinition?.Name?.Content);
        writer.WriteNumber("x", bg.X);
        writer.WriteNumber("y", bg.Y);
        writer.WriteBoolean("tiled_horizontally", bg.TiledHorizontally);
        writer.WriteBoolean("tiled_vertically", bg.TiledVertically);
        writer.WriteNumber("speed_x", bg.SpeedX);
        writer.WriteNumber("speed_y", bg.SpeedY);
        writer.WriteBoolean("stretch", bg.Stretch);
        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
}

void WriteViews(Utf8JsonWriter writer, UndertaleRoom room)
{
    writer.WriteStartArray("views");
    
    foreach (var view in room.Views)
    {
        writer.WriteStartObject();
        writer.WriteBoolean("enabled", view.Enabled);
        writer.WriteNumber("view_x", view.ViewX);
        writer.WriteNumber("view_y", view.ViewY);
        writer.WriteNumber("view_width", view.ViewWidth);
        writer.WriteNumber("view_height", view.ViewHeight);
        writer.WriteNumber("port_x", view.PortX);
        writer.WriteNumber("port_y", view.PortY);
        writer.WriteNumber("port_width", view.PortWidth);
        writer.WriteNumber("port_height", view.PortHeight);
        writer.WriteNumber("border_x", view.BorderX);
        writer.WriteNumber("border_y", view.BorderY);
        writer.WriteNumber("speed_x", view.SpeedX);
        writer.WriteNumber("speed_y", view.SpeedY);
        writer.WriteString("object_id", view.ObjectId?.Name?.Content);
        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
}

void WriteGameObjects(Utf8JsonWriter writer, UndertaleRoom room)
{
    writer.WriteStartArray("game_objects");
    
    foreach (var obj in room.GameObjects)
    {
        writer.WriteStartObject();
        writer.WriteNumber("x", obj.X);
        writer.WriteNumber("y", obj.Y);
        writer.WriteString("object_definition", obj.ObjectDefinition?.Name?.Content);
        writer.WriteNumber("instance_id", obj.InstanceID);
        writer.WriteString("creation_code", obj.CreationCode?.Name?.Content);
        writer.WriteNumber("scale_x", obj.ScaleX);
        writer.WriteNumber("scale_y", obj.ScaleY);
        writer.WriteNumber("color", obj.Color);
        writer.WriteNumber("rotation", obj.Rotation);
        writer.WriteString("pre_create_code", obj.PreCreateCode?.Name?.Content);
        writer.WriteNumber("image_speed", obj.ImageSpeed);
        writer.WriteNumber("image_index", obj.ImageIndex);
        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
}

void WriteTiles(Utf8JsonWriter writer, UndertaleRoom room)
{
    writer.WriteStartArray("tiles");
    
    foreach (var tile in room.Tiles)
    {
        writer.WriteStartObject();
        writer.WriteBoolean("sprite_mode", tile.spriteMode);
        writer.WriteNumber("x", tile.X);
        writer.WriteNumber("y", tile.Y);
        writer.WriteString("background_definition", tile.BackgroundDefinition?.Name?.Content);
        writer.WriteString("sprite_definition", tile.SpriteDefinition?.Name?.Content);
        writer.WriteNumber("source_x", tile.SourceX);
        writer.WriteNumber("source_y", tile.SourceY);
        writer.WriteNumber("width", tile.Width);
        writer.WriteNumber("height", tile.Height);
        writer.WriteNumber("tile_depth", tile.TileDepth);
        writer.WriteNumber("instance_id", tile.InstanceID);
        writer.WriteNumber("scale_x", tile.ScaleX);
        writer.WriteNumber("scale_y", tile.ScaleY);
        writer.WriteNumber("color", tile.Color);
        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
}

void WriteLayers(Utf8JsonWriter writer, UndertaleRoom room)
{
    writer.WriteStartArray("layers");
    
    foreach (var layer in room.Layers)
    {
        writer.WriteStartObject();
        writer.WriteString("layer_name", layer.LayerName?.Content);
        writer.WriteNumber("layer_id", layer.LayerId);
        writer.WriteNumber("layer_type", (int)layer.LayerType);
        writer.WriteNumber("layer_depth", layer.LayerDepth);
        writer.WriteNumber("x_offset", layer.XOffset);
        writer.WriteNumber("y_offset", layer.YOffset);
        writer.WriteNumber("h_speed", layer.HSpeed);
        writer.WriteNumber("v_speed", layer.VSpeed);
        writer.WriteBoolean("is_visible", layer.IsVisible);

        writer.WritePropertyName("layer_data");
        switch (layer.LayerType)
        {
            case UndertaleRoom.LayerType.Background:
                WriteBackgroundLayer(writer, layer);
                break;
            case UndertaleRoom.LayerType.Instances:
                WriteInstancesLayer(writer, layer);
                break;
            case UndertaleRoom.LayerType.Assets:
                WriteAssetsLayer(writer, layer);
                break;
            case UndertaleRoom.LayerType.Tiles:
                WriteTilesLayer(writer, layer);
                break;
            default:
                writer.WriteNullValue();
                break;
        }

        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
}

void WriteBackgroundLayer(Utf8JsonWriter writer, UndertaleRoom.Layer layer)
{
    var bgData = layer.Data as UndertaleRoom.Layer.LayerBackgroundData;
    if (bgData == null)
    {
        writer.WriteNullValue();
        return;
    }

    writer.WriteStartObject();
    writer.WriteBoolean("visible", bgData.Visible);
    writer.WriteBoolean("foreground", bgData.Foreground);
    writer.WriteString("sprite", bgData.Sprite?.Name?.Content);
    writer.WriteBoolean("tiled_horizontally", bgData.TiledHorizontally);
    writer.WriteBoolean("tiled_vertically", bgData.TiledVertically);
    writer.WriteBoolean("stretch", bgData.Stretch);
    writer.WriteNumber("color", bgData.Color);
    writer.WriteNumber("first_frame", bgData.FirstFrame);
    writer.WriteNumber("animation_speed", bgData.AnimationSpeed);
    writer.WriteNumber("animation_speed_type", (int)bgData.AnimationSpeedType);
    writer.WriteEndObject();
}

void WriteInstancesLayer(Utf8JsonWriter writer, UndertaleRoom.Layer layer)
{
    var instanceData = layer.Data as UndertaleRoom.Layer.LayerInstancesData;
    if (instanceData == null)
    {
        writer.WriteNullValue();
        return;
    }

    writer.WriteStartObject();
    writer.WriteStartArray("instances");
    
    foreach (var obj in instanceData.Instances)
    {
        writer.WriteStartObject();
        writer.WriteNumber("x", obj.X);
        writer.WriteNumber("y", obj.Y);
        writer.WriteString("object_definition", obj.ObjectDefinition?.Name?.Content);
        writer.WriteNumber("instance_id", obj.InstanceID);
        writer.WriteString("creation_code", obj.CreationCode?.Name?.Content);
        writer.WriteNumber("scale_x", obj.ScaleX);
        writer.WriteNumber("scale_y", obj.ScaleY);
        writer.WriteNumber("color", obj.Color);
        writer.WriteNumber("rotation", obj.Rotation);
        writer.WriteString("pre_create_code", obj.PreCreateCode?.Name?.Content);
        writer.WriteNumber("image_speed", obj.ImageSpeed);
        writer.WriteNumber("image_index", obj.ImageIndex);
        writer.WriteEndObject();
    }
    
    writer.WriteEndArray();
    writer.WriteEndObject();
}

void WriteAssetsLayer(Utf8JsonWriter writer, UndertaleRoom.Layer layer)
{
    var assetData = layer.Data as UndertaleRoom.Layer.LayerAssetsData;
    if (assetData == null)
    {
        writer.WriteNullValue();
        return;
    }

    writer.WriteStartObject();

    // Legacy tiles
    writer.WriteStartArray("legacy_tiles");
    if (assetData.LegacyTiles != null)
    {
        foreach (var tile in assetData.LegacyTiles)
        {
            writer.WriteStartObject();
            writer.WriteBoolean("sprite_mode", tile.spriteMode);
            writer.WriteNumber("x", tile.X);
            writer.WriteNumber("y", tile.Y);
            writer.WriteString("background_definition", tile.BackgroundDefinition?.Name?.Content);
            writer.WriteString("sprite_definition", tile.SpriteDefinition?.Name?.Content);
            writer.WriteNumber("source_x", tile.SourceX);
            writer.WriteNumber("source_y", tile.SourceY);
            writer.WriteNumber("width", tile.Width);
            writer.WriteNumber("height", tile.Height);
            writer.WriteNumber("tile_depth", tile.TileDepth);
            writer.WriteNumber("instance_id", tile.InstanceID);
            writer.WriteNumber("scale_x", tile.ScaleX);
            writer.WriteNumber("scale_y", tile.ScaleY);
            writer.WriteNumber("color", tile.Color);
            writer.WriteEndObject();
        }
    }
    writer.WriteEndArray();

    // Sprites
    writer.WriteStartArray("sprites");
    if (assetData.Sprites != null)
    {
        foreach (var sprite in assetData.Sprites)
        {
            writer.WriteStartObject();
            writer.WriteString("name", sprite.Name?.Content);
            writer.WriteString("sprite", sprite.Sprite?.Name?.Content);
            writer.WriteNumber("x", sprite.X);
            writer.WriteNumber("y", sprite.Y);
            writer.WriteNumber("scale_x", sprite.ScaleX);
            writer.WriteNumber("scale_y", sprite.ScaleY);
            writer.WriteNumber("color", sprite.Color);
            writer.WriteNumber("animation_speed", sprite.AnimationSpeed);
            writer.WriteNumber("animation_speed_type", (int)sprite.AnimationSpeedType);
            writer.WriteNumber("frame_index", sprite.FrameIndex);
            writer.WriteNumber("rotation", sprite.Rotation);
            writer.WriteEndObject();
        }
    }
    writer.WriteEndArray();

    // Sequences
    writer.WriteStartArray("sequences");
    if (assetData.Sequences != null)
    {
        foreach (var seq in assetData.Sequences)
        {
            writer.WriteStartObject();
            writer.WriteString("name", seq.Name?.Content);
            writer.WriteString("sequence", seq.Sequence?.Name?.Content);
            writer.WriteNumber("x", seq.X);
            writer.WriteNumber("y", seq.Y);
            writer.WriteNumber("scale_x", seq.ScaleX);
            writer.WriteNumber("scale_y", seq.ScaleY);
            writer.WriteNumber("color", seq.Color);
            writer.WriteNumber("animation_speed", seq.AnimationSpeed);
            writer.WriteNumber("animation_speed_type", (int)seq.AnimationSpeedType);
            writer.WriteNumber("frame_index", seq.FrameIndex);
            writer.WriteNumber("rotation", seq.Rotation);
            writer.WriteEndObject();
        }
    }
    writer.WriteEndArray();

    // Nine slices
    writer.WriteStartArray("nine_slices");
    if (assetData.NineSlices != null)
    {
        foreach (var nineSlice in assetData.NineSlices)
        {
            writer.WriteStartObject();
            writer.WriteString("name", nineSlice.Name?.Content);
            writer.WriteString("sprite", nineSlice.Sprite?.Name?.Content);
            writer.WriteNumber("x", nineSlice.X);
            writer.WriteNumber("y", nineSlice.Y);
            writer.WriteNumber("scale_x", nineSlice.ScaleX);
            writer.WriteNumber("scale_y", nineSlice.ScaleY);
            writer.WriteNumber("color", nineSlice.Color);
            writer.WriteNumber("animation_speed", nineSlice.AnimationSpeed);
            writer.WriteNumber("animation_speed_type", (int)nineSlice.AnimationSpeedType);
            writer.WriteNumber("frame_index", nineSlice.FrameIndex);
            writer.WriteNumber("rotation", nineSlice.Rotation);
            writer.WriteEndObject();
        }
    }
    writer.WriteEndArray();

    writer.WriteEndObject();
}

void WriteTilesLayer(Utf8JsonWriter writer, UndertaleRoom.Layer layer)
{
    var tileData = layer.Data as UndertaleRoom.Layer.LayerTilesData;
    if (tileData == null)
    {
        writer.WriteNullValue();
        return;
    }

    writer.WriteStartObject();
    writer.WriteString("background", tileData.Background?.Name?.Content);
    writer.WriteNumber("tiles_x", tileData.TilesX);
    writer.WriteNumber("tiles_y", tileData.TilesY);

    writer.WriteStartArray("tile_data");
    if (tileData.TileData != null)
    {
        for (int y = 0; y < tileData.TilesY; y++)
        {
            writer.WriteStartArray();
            for (int x = 0; x < tileData.TilesX; x++)
            {
                writer.WriteStartObject();
                writer.WriteNumber("id", tileData.TileData[y][x]);
                writer.WriteEndObject();
            }
            writer.WriteEndArray();
        }
    }
    writer.WriteEndArray();

    writer.WriteEndObject();
}