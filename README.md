# Metaverse Animation Packager

This tool will help you bundle your 3D assets for use in [Metaverse Studio](https://gometa.io). Right now, due to restrictions with iOS, you will need to use a Mac to bundle your assets.

## Prerequisites

- A computer running macOS
- A Wavefront (OBJ) export of your 3D asset, including materials and textures
- A PNG or animated GIF preview of your 3D asset, with transparency
- If your asset has animations, a separate Collada (DAE) export for each animation

**Notes when exporting Collada files**
- Make sure image textures are referenced relative to the `.dae` file. **If your texture uses absolute paths, it will not render correctly.** You can verify this by opening the `.dae` file in a text editor and looking fort the `<library_images>` tag. If all you see in the `<init_from>` tags is the texture name, you're good. If you see things like `file:///Users/user/Desktop/` or anything like that, you will need to edit the file to remove the path.
- Make sure your units are set to **meters**
- Make sure your object scale is normalized to (1, 1, 1)

## Setting up the directories

Look at the `example/astronaut` folder in this repository for an example of how you must setup the directory. You *MUST* have a folder named `obj`, containing in its root the OBJ export. If your asset has animations, you must export each named animation to its own folder under a folder named `dae`. The name of the folder will be the display name of the animation in Metaverse studio. Each animation must include its own copy of the image textures.

## Packaging

Run the `package.sh` script with the folder root as the argument:

```bash
$ ./package.sh example/astronaut
```

When the script finishes, you will have a ZIP archive named `folder.meta.zip` that can be uploaded to Metaverse Studio.

## Notes

- Metaverse loads assets over the network. Please be concious of this when designing and exporting your assets. For seamless loading, you should keep each export under 5MB in size.