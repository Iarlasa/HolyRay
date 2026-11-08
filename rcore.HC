/*
Some features i couldnt figure out how to port to holyc, most of them have been tagged with ??FIND??. so you can check them out
This is basically just the header file of the normal version but ported to holyc 
The HolyC bindings were made by Iarla.
*/
//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
#ifndef PI
    #define PI 3.14159265358979323846f
#endif
#ifndef DEG2RAD
    #define DEG2RAD (PI/180.0f)
#endif
#ifndef RAD2DEG
    #define RAD2DEG (180.0f/PI)
#endif

// Allow custom memory allocators
// NOTE: Require recompiling raylib sources
// Note: commented out because i have no clue how these work so ill ignore them for now
/*
#ifndef RL_MALLOC
    #define RL_MALLOC(sz) malloc(sz)
#endif
#ifndef RL_CALLOC
    #define RL_CALLOC(n,sz) calloc(n,sz)
#endif
#ifndef RL_REALLOC
    #define RL_REALLOC(ptr,sz) realloc(ptr,sz)
#endif
#ifndef RL_FREE
	#define RL_FREE(ptr) free(ptr)
#endif
*/

// NOTE: removed cpp stuff that was here

// NOTE: Set some defines with some data types declared by raylib
// Other modules (raymath, rlgl) also require some of those types, so,
// to be able to use those other modules as standalone (not depending on raylib)
// this defines are useful for internal check and avoid type (re)definitions
#define RL_COLOR_TYPE
#define RL_RECTANGLE_TYPE
#define RL_VECTOR2_TYPE
#define RL_VECTOR3_TYPE
#define RL_VECTOR4_TYPE
#define RL_QUATERNION_TYPE
#define RL_MATRIX_TYPE

//NOTE: HolyC cant have structs for #define, it only accepts strings or numbers. 
// Im puttings the Color class here and changing all the macros to variables
// Color, 4 components, R8G8B8A8 (32bit)
class Color {
    U8 r;        // Color red value
    U8 g;        // Color green value
    U8 b;        // Color blue value
    U8 a;        // Color alpha value
};
// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background
Color LIGHTGRAY = { 200, 200, 200, 255 };   // Light Gray
Color GRAY     =  { 130, 130, 130, 255 };   // Gray
Color DARKGRAY =  { 80, 80, 80, 255 };     // Dark Gray
Color YELLOW =    { 253, 249, 0, 255 };     // Yellow
Color GOLD   =    { 255, 203, 0, 255 };     // Gold
Color ORANGE  =   { 255, 161, 0, 255 };     // Orange
Color PINK    =   { 255, 109, 194, 255 };   // Pink
Color RED  =      { 230, 41, 55, 255 };     // Red
Color MAROON   =  { 190, 33, 55, 255 };     // Maroon
Color GREEN   =   { 0, 228, 48, 255 };      // Green
Color LIME    =   { 0, 158, 47, 255 };      // Lime
Color DARKGREEN=  { 0, 117, 44, 255 };      // Dark Green
Color SKYBLUE =   { 102, 191, 255, 255 };   // Sky Blue
Color BLUE    =   { 0, 121, 241, 255 };     // Blue
Color DARKBLUE =  { 0, 82, 172, 255 } ;     // Dark Blue
Color PURPLE  =   { 200, 122, 255, 255 };   // Purple
Color VIOLET  =   { 135, 60, 190, 255 };    // Violet
Color DARKPURPLE ={ 112, 31, 126, 255 };    // Dark Purple
Color BEIGE  =    { 211, 176, 131, 255 };   // Beige
Color BROWN  =    { 127, 106, 79, 255 };    // Brown
Color DARKBROWN=  { 76, 63, 47, 255 }  ;    // Dark Brown

Color WHITE   =   { 255, 255, 255, 255 };   // White
Color BLACK   =   { 0, 0, 0, 255 };         // Black
Color BLANK    =  { 0, 0, 0, 0 };           // Blank (Transparent)
Color MAGENTA  =  { 255, 0, 255, 255 };     // Magenta
Color RAYWHITE =  { 245, 245, 245, 255 };   // My own White (raylib logo)

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Removed stuff about bools because holy c is gods chosen language and has bools already.

// Vector2, 2 components
class Vector2 {
    F32 x;                // Vector x component
    F32 y;                // Vector y component
};

// Vector3, 3 components
class Vector3 {
    F32 x;                // Vector x component
    F32 y;                // Vector y component
    F32 z;                // Vector z component
};

// Vector4, 4 components
class Vector4 {
    F32 x;                // Vector x component
    F32 y;                // Vector y component
    F32 z;                // Vector z component
    F32 w;                // Vector w component
};

// Quaternion, 4 components (Vector4 alias). holy c doesnt have aliasing, so im not sure if you can use quaternions like you can in c
//typedef Vector4 Quaternion;
class Quaternion {
    F32 x;                // Vector x component
    F32 y;                // Vector y component
    F32 z;                // Vector z component
    F32 w;                // Vector w component
};


// Matrix, 4x4 components, column major, OpenGL style, right-handed
class Matrix {
    F32 m0, m4, m8, m12;  // Matrix first row (4 components)
    F32 m1, m5, m9, m13;  // Matrix second row (4 components)
    F32 m2, m6, m10, m14; // Matrix third row (4 components)
    F32 m3, m7, m11, m15; // Matrix fourth row (4 components)
};


// Rectangle, 4 components
class Rectangle {
    F32 x;                // Rectangle top-left corner position x
    F32 y;                // Rectangle top-left corner position y
    F32 width;            // Rectangle width
    F32 height;           // Rectangle height
};

// Image, pixel data stored in CPU memory (RAM)
class Image {
    U0 *data;             // Image raw data
    I32 width;              // Image base width
    I32 height;             // Image base height
    I32 mipmaps;            // Mipmap levels, 1 by default
    I32 format;             // Data format (PixelFormat type)
};

// Texture, tex data stored in GPU memory (VRAM)
class Texture {
    U32 id;        // OpenGL texture id
    I32 width;              // Texture base width
    I32 height;             // Texture base height
    I32 mipmaps;            // Mipmap levels, 1 by default
    I32 format;             // Data format (PixelFormat type)
};

// Texture2D, same as Texture
//typedef Texture Texture2D;
class Texture2D {
    U32 id;        // OpenGL texture id
    I32 width;              // Texture base width
    I32 height;             // Texture base height
    I32 mipmaps;            // Mipmap levels, 1 by default
    I32 format;             // Data format (PixelFormat type)
};
// TextureCubemap, same as Texture
//typedef Texture TextureCubemap;
class TextureCubemap {
    U32 id;        // OpenGL texture id
    I32 width;              // Texture base width
    I32 height;             // Texture base height
    I32 mipmaps;            // Mipmap levels, 1 by default
    I32 format;             // Data format (PixelFormat type)
};


// RenderTexture, fbo for texture rendering
class RenderTexture {
    U32 id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
};


// RenderTexture2D, same as RenderTexture ##
//typedef RenderTexture RenderTexture2D;
class RenderTexture2D {
    U32 id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
};


// NPatchInfo, n-patch layout info
class NPatchInfo {
    Rectangle source;       // Texture source rectangle
    I32 left;               // Left border offset
    I32 top;                // Top border offset
    I32 right;              // Right border offset
    I32 bottom;             // Bottom border offset
    I32 layout;             // Layout of the n-patch: 3x3, 1x3 or 3x1
};

// GlyphInfo, font characters glyphs info
class GlyphInfo {
    I32 value;              // Character value (Unicode)
    I32 offsetX;            // Character offset X when drawing
    I32 offsetY;            // Character offset Y when drawing
    I32 advanceX;           // Character advance position X
    Image image;            // Character image data
};

// Font, font texture and GlyphInfo array data
class Font {
    I32 baseSize;           // Base size (default chars height)
    I32 glyphCount;         // Number of glyph characters
    I32 glyphPadding;       // Padding around the glyph characters
    Texture texture;      // Texture atlas containing the glyphs
    Rectangle *recs;        // Rectangles in texture for the glyphs
    GlyphInfo *glyphs;      // Glyphs info data
};

// Camera, defines position/orientation in 3d space
class Camera3D {
    Vector3 position;       // Camera position
    Vector3 target;         // Camera target it looks-at
    Vector3 up;             // Camera up vector (rotation over its axis)
    F32 fovy;             // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    I32 projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
};

//typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D
class Camera3D {
    Vector3 position;       // Camera position
    Vector3 target;         // Camera target it looks-at
    Vector3 up;             // Camera up vector (rotation over its axis)
    F32 fovy;             // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    I32 projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
};


// Camera2D, defines position/orientation in 2d space
class Camera2D {
    Vector2 offset;         // Camera offset (screen space offset from window origin, unscaled by DPI, real pixel size)
    Vector2 target;         // Camera target (world space target point that is mapped to screen space offset)
    F32 rotation;         // Camera rotation in degrees (pivots around target)
    F32 zoom;             // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
};

// Mesh, vertex data and vao/vbo
class Mesh {
    I32 vertexCount;        // Number of vertices stored in arrays
    I32 triangleCount;      // Number of triangles stored (indexed or not)

    // Vertex attributes data
    F32 *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    F32 *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    F32 *texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    F32 *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    F32 *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    U8 *colors;  // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    U16 *indices; // Vertex indices (in case vertex data comes indexed)

    // Skin data for animation
    I32 boneCount;          // Number of bones (MAX: 256 bones)
    U8 *boneIndices; // Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
    F32 *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)

    // Runtime animation vertex data (CPU skinning)
    // NOTE: In case of GPU skinning, not used, pointers are NULL
    F32 *animVertices;    // Animated vertex positions (after bones transformations)
    F32 *animNormals;     // Animated normals (after bones transformations)

    // OpenGL identifiers
    U32 vaoId;     // OpenGL Vertex Array Object id
    U32 *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
};

// Shader
class Shader {
    U32 id;        // Shader program id
    I32 *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
};

// MaterialMap
class MaterialMap {
    Texture texture;      // Material map texture
    Color color;            // Material map color
    F32 value;            // Material map value
};

// Material, includes shader and maps
class Material {
    Shader shader;          // Material shader
    MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
    F32 params[4];        // Material generic parameters (if required)
};

// Transform, vertex transformation data
class Transform {
    Vector3 translation;    // Translation
    Vector4 rotation;    // Rotation
    Vector3 scale;          // Scale
};


// ??FIND?? i couldnt figure out how to do *ModelAnimPose, so i just swapped all instances out with Transform* __
// Anim pose, an array of Transform[]
//typedef Transform *ModelAnimPose;

// Bone, skeletal animation bone
class BoneInfo {
    U8 name[32];          // Bone name
    I32 parent;             // Bone parent
};

// Skeleton, animation bones hierarchy
class ModelSkeleton {
    U32 boneCount; // Number of bones
    BoneInfo *bones;        // Bones information (skeleton)
    Transform* bindPose; // Bones base transformation (Transform[])
};

// Model, meshes, materials and animation data
class Model {
    Matrix transform;       // Local transform matrix

    I32 meshCount;          // Number of meshes
    I32 materialCount;      // Number of materials
    Mesh *meshes;           // Meshes array
    Material *materials;    // Materials array
    I32 *meshMaterial;      // Mesh material number

    // Animation data
    ModelSkeleton skeleton; // Skeleton for animation

    // Runtime animation data (CPU/GPU skinning)
    Transform* currentPose; // Current animation pose (Transform[])
    Matrix *boneMatrices;   // Bones animated transformation matrices
};

// ModelAnimation, contains a full animation sequence
class ModelAnimation {
    U8 name[32];          // Animation name

    U32 boneCount; // Number of bones (per pose)
    I32 keyframeCount;      // Number of animation key frames
    Transform* *keyframePoses; // Animation sequence keyframe poses [keyframe][pose]
};

// Ray, ray for raycasting
class Ray {
    Vector3 position;       // Ray position (origin)
    Vector3 direction;      // Ray direction (normalized)
};

// RayCollision, ray hit information
class RayCollision {
    Bool hit;               // Did the ray hit something?
    F32 distance;         // Distance to the nearest hit
    Vector3 point;          // Point of the nearest hit
    Vector3 normal;         // Surface normal of hit
};

// BoundingBox
class BoundingBox {
    Vector3 min;            // Minimum vertex box-corner
    Vector3 max;            // Maximum vertex box-corner
};

// Wave, audio wave data
class Wave {
    U32 frameCount;    // Total number of frames (considering channels)
    U32 sampleRate;    // Frequency (samples per second)
    U32 sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    U32 channels;      // Number of channels (1-mono, 2-stereo, ...)
    U0 *data;                 // Buffer data pointer
};

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
class rAudioBuffer;
class rAudioProcessor;

// AudioStream, custom audio stream
class AudioStream {
    rAudioBuffer *buffer;       // Pointer to internal data used by the audio system
    rAudioProcessor *processor; // Pointer to internal data processor, useful for audio effects

    U32 sampleRate;    // Frequency (samples per second)
    U32 sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    U32 channels;      // Number of channels (1-mono, 2-stereo, ...)
};

// Sound
class Sound {
    AudioStream stream;         // Audio stream
    U32 frameCount;    // Total number of frames (considering channels)
};

// Music, audio stream, anything longer than ~10 seconds should be streamed
class Music {
    AudioStream stream;         // Audio stream
    U32 frameCount;    // Total number of frames (considering channels)
    Bool looping;               // Music looping enable

    I32 ctxType;                // Type of music context (audio filetype)
    U0 *ctxData;              // Audio context data, depends on type
};

// VrDeviceInfo, Head-Mounted-Display device parameters
class VrDeviceInfo {
    I32 hResolution;                // Horizontal resolution in pixels
    I32 vResolution;                // Vertical resolution in pixels
    F32 hScreenSize;              // Horizontal size in meters
    F32 vScreenSize;              // Vertical size in meters
    F32 eyeToScreenDistance;      // Distance between eye and display in meters
    F32 lensSeparationDistance;   // Lens separation distance in meters
    F32 interpupillaryDistance;   // IPD (distance between pupils) in meters
    F32 lensDistortionValues[4];  // Lens distortion ant parameters
    F32 chromaAbCorrection[4];    // Chromatic aberration correction parameters
};

// VrStereoConfig, VR stereo rendering configuration for simulator
class VrStereoConfig {
    Matrix projection[2];           // VR projection matrices (per eye)
    Matrix viewOffset[2];           // VR view offset matrices (per eye)
    F32 leftLensCenter[2];        // VR left lens center
    F32 rightLensCenter[2];       // VR right lens center
    F32 leftScreenCenter[2];      // VR left screen center
    F32 rightScreenCenter[2];     // VR right screen center
    F32 scale[2];                 // VR distortion scale
    F32 scaleIn[2];               // VR distortion scale in
};

// File path list
class FilePathList {
    U32 count;             // Filepaths entries count
    U8 **paths;                   // Filepaths entries
};

// Automation event
class AutomationEvent {
    U32 frame;             // Event frame
    U32 type;              // Event type (AutomationEventType)
    I32 params[4];                  // Event parameters (if required)
};

// Automation event list
class AutomationEventList {
    U32 capacity;          // Events max entries (MAX_AUTOMATION_EVENTS)
    U32 count;             // Events entries count
    AutomationEvent *events;        // Events entries
};

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
#define FLAG_VSYNC_HINT 				0x00000040   	// Set to try enabling V-Sync on GPU
#define FLAG_FULLSCREEN_MODE    		0x00000002   	// Set to run program in fullscreen
#define FLAG_WINDOW_RESIZABLE   		0x00000004   	// Set to allow resizable window
#define FLAG_WINDOW_UNDECORATED 		0x00000008   	// Set to disable window decoration (frame and buttons)
#define FLAG_WINDOW_HIDDEN      		0x00000080   	// Set to hide window
#define FLAG_WINDOW_MINIMIZED 			0x00000200   	// Set to minimize window (iconify)
#define FLAG_WINDOW_MAXIMIZED 			0x00000400   	// Set to maximize window (expanded to monitor)
#define FLAG_WINDOW_UNFOCUSED 			0x00000800   	// Set to window non focused
#define FLAG_WINDOW_TOPMOST 			0x00001000   	// Set to window always on top
#define FLAG_WINDOW_ALWAYS_RUN 			0x00000100   	// Set to allow windows running while minimized
#define FLAG_WINDOW_TRANSPARENT 		0x00000010   	// Set to allow transparent framebuffer
#define FLAG_WINDOW_HIGHDPI     		0x00002000	 	// Set to support HighDPI
#define FLAG_WINDOW_MOUSE_PASSTHROUGH 	0x00004000		// Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
#define FLAG_BORDERLESS_WINDOWED_MODE 	0x00008000		// Set to run program in borderless windowed mode
#define FLAG_MSAA_4X_HINT 				0x00000020		// Set to try enabling MSAA 4X
#define FLAG_INTERLACED_HINT 			0x00010000		// Set to try enabling interlaced video format (for V3D)

// Trace log level
// NOTE: Organized by priority level
#define LOG_ALL 0 	        	// Display all logs
#define LOG_TRACE 1  	       // Trace logging, intended for internal use only
#define LOG_DEBUG 2     	   // Debug logging, used for internal debugging, it should be disabled on release builds
#define LOG_INFO 3				// Info logging, used for program execution info
#define LOG_WARNING 4       		// Warning logging, used on recoverable failures
#define LOG_ERROR 5         // Error logging, used on unrecoverable failures
#define LOG_FATAL 6         // Fatal logging, used to abort program: exit(EXIT_FAILURE)
#define LOG_NONE 7           // Disable logging

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining required keys for alternative layouts

#define    KEY_NULL             0        // Key: NULL, used for no key pressed
    // Alphanumeric keys
#define    KEY_APOSTROPHE       39       // Key: '
#define    KEY_COMMA            44       // Key: ,
#define    KEY_MINUS            45       // Key: -
#define    KEY_PERIOD           46       // Key: .
#define    KEY_SLASH            47       // Key: /
#define    KEY_ZERO             48       // Key: 0
#define    KEY_ONE              49       // Key: 1
#define    KEY_TWO              50       // Key: 2
#define    KEY_THREE            51       // Key: 3
#define    KEY_FOUR             52       // Key: 4
#define    KEY_FIVE             53       // Key: 5
#define    KEY_SIX              54       // Key: 6
#define    KEY_SEVEN            55       // Key: 7
#define    KEY_EIGHT            56       // Key: 8
#define    KEY_NINE             57       // Key: 9
#define    KEY_SEMICOLON        59       // Key: ;
#define    KEY_EQUAL            61       // Key: 
#define    KEY_A                65       // Key: A | a
#define    KEY_B                66       // Key: B | b
#define    KEY_C                67       // Key: C | c
#define    KEY_D                68       // Key: D | d
#define    KEY_E                69       // Key: E | e
#define    KEY_F                70       // Key: F | f
#define    KEY_G                71       // Key: G | g
#define    KEY_H                72       // Key: H | h
#define    KEY_I                73       // Key: I | i
#define    KEY_J                74       // Key: J | j
#define    KEY_K                75       // Key: K | k
#define    KEY_L                76       // Key: L | l
#define    KEY_M                77       // Key: M | m
#define    KEY_N                78       // Key: N | n
#define    KEY_O                79       // Key: O | o
#define    KEY_P                80       // Key: P | p
#define    KEY_Q                81       // Key: Q | q
#define    KEY_R                82       // Key: R | r
#define    KEY_S                83       // Key: S | s
#define    KEY_T                84       // Key: T | t
#define    KEY_U                85       // Key: U | u
#define    KEY_V                86       // Key: V | v
#define    KEY_W                87       // Key: W | w
#define    KEY_X                88       // Key: X | x
#define    KEY_Y                89       // Key: Y | y
#define    KEY_Z                90       // Key: Z | z
#define    KEY_LEFT_BRACKET     91       // Key: [
#define    KEY_BACKSLASH        92       // Key: '\'
#define    KEY_RIGHT_BRACKET    93       // Key: ]
#define    KEY_GRAVE            96       // Key: `
    // Function keys
#define    KEY_SPACE            32       // Key: Space
#define    KEY_ESCAPE           256      // Key: Esc
#define    KEY_ENTER            257      // Key: Enter
#define    KEY_TAB              258      // Key: Tab
#define    KEY_BACKSPACE        259      // Key: Backspace
#define    KEY_INSERT           260      // Key: Ins
#define    KEY_DELETE           261      // Key: Del
#define    KEY_RIGHT            262      // Key: Cursor right
#define    KEY_LEFT             263      // Key: Cursor left
#define    KEY_DOWN             264      // Key: Cursor down
#define    KEY_UP               265      // Key: Cursor up
#define    KEY_PAGE_UP          266      // Key: Page up
#define    KEY_PAGE_DOWN        267      // Key: Page down
#define    KEY_HOME             268      // Key: Home
#define    KEY_END              269      // Key: End
#define    KEY_CAPS_LOCK        280      // Key: Caps lock
#define    KEY_SCROLL_LOCK      281      // Key: Scroll down
#define    KEY_NUM_LOCK         282      // Key: Num lock
#define    KEY_PRINT_SCREEN     283      // Key: Print screen
#define    KEY_PAUSE            284      // Key: Pause
#define    KEY_F1               290      // Key: F1
#define    KEY_F2               291      // Key: F2
#define    KEY_F3               292      // Key: F3
#define    KEY_F4               293      // Key: F4
#define    KEY_F5               294      // Key: F5
#define    KEY_F6               295      // Key: F6
#define    KEY_F7               296      // Key: F7
#define    KEY_F8               297      // Key: F8
#define    KEY_F9               298      // Key: F9
#define    KEY_F10              299      // Key: F10
#define    KEY_F11              300      // Key: F11
#define    KEY_F12              301      // Key: F12
#define    KEY_LEFT_SHIFT       340      // Key: Shift left
#define    KEY_LEFT_CONTROL     341      // Key: Control left
#define    KEY_LEFT_ALT         342      // Key: Alt left
#define    KEY_LEFT_SUPER       343      // Key: Super left
#define    KEY_RIGHT_SHIFT      344      // Key: Shift right
#define    KEY_RIGHT_CONTROL    345      // Key: Control right
#define    KEY_RIGHT_ALT        346      // Key: Alt right
#define    KEY_RIGHT_SUPER      347      // Key: Super right
#define    KEY_KB_MENU          348      // Key: KB menu
    // Keypad keys
#define    KEY_KP_0             320      // Key: Keypad 0
#define    KEY_KP_1             321      // Key: Keypad 1
#define    KEY_KP_2             322      // Key: Keypad 2
#define    KEY_KP_3             323      // Key: Keypad 3
#define    KEY_KP_4             324      // Key: Keypad 4
#define    KEY_KP_5             325      // Key: Keypad 5
#define    KEY_KP_6             326      // Key: Keypad 6
#define    KEY_KP_7             327      // Key: Keypad 7
#define    KEY_KP_8             328      // Key: Keypad 8
#define    KEY_KP_9             329      // Key: Keypad 9
#define    KEY_KP_DECIMAL       330      // Key: Keypad .
#define    KEY_KP_DIVIDE        331      // Key: Keypad /
#define    KEY_KP_MULTIPLY      332      // Key: Keypad *
#define    KEY_KP_SUBTRACT      333      // Key: Keypad -
#define    KEY_KP_ADD           334      // Key: Keypad +
#define    KEY_KP_ENTER         335      // Key: Keypad Enter
#define    KEY_KP_EQUAL         336      // Key: Keypad 
    // Android key buttons
#define    KEY_BACK             4        // Key: Android back button
#define    KEY_MENU             5        // Key: Android menu button
#define    KEY_VOLUME_UP        24       // Key: Android volume up button
#define    KEY_VOLUME_DOWN      25        // Key: Android volume down button

// Add backwards compatibility support for deprecated names
#define MOUSE_LEFT_BUTTON   0
#define MOUSE_RIGHT_BUTTON  1
#define MOUSE_MIDDLE_BUTTON 2

// Mouse buttons
#define    MOUSE_BUTTON_LEFT     0       // Mouse button left
#define    MOUSE_BUTTON_RIGHT    1       // Mouse button right
#define    MOUSE_BUTTON_MIDDLE   2       // Mouse button middle (pressed wheel)
#define    MOUSE_BUTTON_SIDE     3       // Mouse button side (advanced mouse device)
#define    MOUSE_BUTTON_EXTRA    4       // Mouse button extra (advanced mouse device)
#define    MOUSE_BUTTON_FORWARD  5       // Mouse button forward (advanced mouse device)
#define    MOUSE_BUTTON_BACK     6       // Mouse button back (advanced mouse device)

// Mouse cursor

#define    MOUSE_CURSOR_DEFAULT        0     // Default pointer shape
#define    MOUSE_CURSOR_ARROW          1     // Arrow shape
#define    MOUSE_CURSOR_IBEAM          2     // Text writing cursor shape
#define    MOUSE_CURSOR_CROSSHAIR      3     // Cross shape
#define    MOUSE_CURSOR_POINTING_HAND  4     // Pointing hand cursor
#define    MOUSE_CURSOR_RESIZE_EW      5     // Horizontal resize/move arrow shape
#define    MOUSE_CURSOR_RESIZE_NS      6     // Vertical resize/move arrow shape
#define    MOUSE_CURSOR_RESIZE_NWSE    7     // Top-left to bottom-right diagonal resize/move arrow shape
#define    MOUSE_CURSOR_RESIZE_NESW    8     // The top-right to bottom-left diagonal resize/move arrow shape
#define    MOUSE_CURSOR_RESIZE_ALL     9     // The omnidirectional resize/move cursor shape
#define    MOUSE_CURSOR_NOT_ALLOWED    10     // The operation-not-allowed shape

// Gamepad buttons
#define    GAMEPAD_BUTTON_UNKNOWN  0         // Unknown button, for error checking
#define    GAMEPAD_BUTTON_LEFT_FACE_UP  1      // Gamepad left DPAD up button
#define    GAMEPAD_BUTTON_LEFT_FACE_RIGHT 2    // Gamepad left DPAD right button
#define    GAMEPAD_BUTTON_LEFT_FACE_DOWN  3    // Gamepad left DPAD down button
#define    GAMEPAD_BUTTON_LEFT_FACE_LEFT 4     // Gamepad left DPAD left button
#define    GAMEPAD_BUTTON_RIGHT_FACE_UP  5     // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
#define    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT 6   // Gamepad right button right (i.e. PS3: Circle, Xbox: B)
#define    GAMEPAD_BUTTON_RIGHT_FACE_DOWN  7   // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
#define    GAMEPAD_BUTTON_RIGHT_FACE_LEFT 8     // Gamepad right button left (i.e. PS3: Square, Xbox: X)
#define    GAMEPAD_BUTTON_LEFT_TRIGGER_1  9    // Gamepad top/back trigger left (first), it could be a trailing button
#define    GAMEPAD_BUTTON_LEFT_TRIGGER_2  10    // Gamepad top/back trigger left (second), it could be a trailing button
#define    GAMEPAD_BUTTON_RIGHT_TRIGGER_1  11   // Gamepad top/back trigger right (first), it could be a trailing button
#define    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 12    // Gamepad top/back trigger right (second), it could be a trailing button
#define    GAMEPAD_BUTTON_MIDDLE_LEFT 13        // Gamepad center buttons, left one (i.e. PS3: Select)
#define    GAMEPAD_BUTTON_MIDDLE  14            // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
#define    GAMEPAD_BUTTON_MIDDLE_RIGHT 15       // Gamepad center buttons, right one (i.e. PS3: Start)
#define    GAMEPAD_BUTTON_LEFT_THUMB 16         // Gamepad joystick pressed button left
#define    GAMEPAD_BUTTON_RIGHT_THUMB 17         // Gamepad joystick pressed button right


// Gamepad axes
#define    GAMEPAD_AXIS_LEFT_X         0     // Gamepad left stick X axis
#define    GAMEPAD_AXIS_LEFT_Y         1     // Gamepad left stick Y axis
#define    GAMEPAD_AXIS_RIGHT_X        2     // Gamepad right stick X axis
#define    GAMEPAD_AXIS_RIGHT_Y        3     // Gamepad right stick Y axis
#define    GAMEPAD_AXIS_LEFT_TRIGGER   4     // Gamepad back trigger left, pressure level: [1..-1]
#define    GAMEPAD_AXIS_RIGHT_TRIGGER  5      // Gamepad back trigger right pressure level: [1..-1]


// Material map index
#define    MATERIAL_MAP_ALBEDO  0        // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
#define    MATERIAL_MAP_METALNESS  1       // Metalness material (same as: MATERIAL_MAP_SPECULAR)
#define    MATERIAL_MAP_NORMAL  2          // Normal material
#define    MATERIAL_MAP_ROUGHNESS  3       // Roughness material
#define    MATERIAL_MAP_OCCLUSION 4        // Ambient occlusion material
#define    MATERIAL_MAP_EMISSION  5        // Emission material
#define    MATERIAL_MAP_HEIGHT   6         // Heightmap material
#define    MATERIAL_MAP_CUBEMAP  7         // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
#define    MATERIAL_MAP_IRRADIANCE 8       // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
#define    MATERIAL_MAP_PREFILTER  9       // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
#define    MATERIAL_MAP_BRDF  10             // Brdf material

#define MATERIAL_MAP_DIFFUSE      MATERIAL_MAP_ALBEDO
#define MATERIAL_MAP_SPECULAR     MATERIAL_MAP_METALNESS

// Shader location index
// NOTE: Some locations are tried to be set automatically on shader loading
// but only if default attributes/uniforms names are found check config.h for names
#define    SHADER_LOC_VERTEX_POSITION  0 // Shader location: vertex attribute: position
#define    SHADER_LOC_VERTEX_TEXCOORD01 1  // Shader location: vertex attribute: texcoord01
#define    SHADER_LOC_VERTEX_TEXCOORD02 2  // Shader location: vertex attribute: texcoord02
#define    SHADER_LOC_VERTEX_NORMAL     3  // Shader location: vertex attribute: normal
#define    SHADER_LOC_VERTEX_TANGENT  4    // Shader location: vertex attribute: tangent
#define    SHADER_LOC_VERTEX_COLOR    5    // Shader location: vertex attribute: color
#define    SHADER_LOC_MATRIX_MVP      6    // Shader location: matrix uniform: model-view-projection
#define    SHADER_LOC_MATRIX_VIEW     7    // Shader location: matrix uniform: view (camera transform)
#define    SHADER_LOC_MATRIX_PROJECTION 8   // Shader location: matrix uniform: projection
#define    SHADER_LOC_MATRIX_MODEL   9     // Shader location: matrix uniform: model (transform)
#define    SHADER_LOC_MATRIX_NORMAL  10     // Shader location: matrix uniform: normal
#define    SHADER_LOC_VECTOR_VIEW     11    // Shader location: vector uniform: view
#define    SHADER_LOC_COLOR_DIFFUSE   12    // Shader location: vector uniform: diffuse color
#define    SHADER_LOC_COLOR_SPECULAR  13    // Shader location: vector uniform: specular color
#define    SHADER_LOC_COLOR_AMBIENT   14    // Shader location: vector uniform: ambient color
#define    SHADER_LOC_MAP_ALBEDO      15    // Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
#define    SHADER_LOC_MAP_METALNESS   16    // Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
#define    SHADER_LOC_MAP_NORMAL     17     // Shader location: sampler2d texture: normal
#define    SHADER_LOC_MAP_ROUGHNESS 18      // Shader location: sampler2d texture: roughness
#define    SHADER_LOC_MAP_OCCLUSION   19    // Shader location: sampler2d texture: occlusion
#define    SHADER_LOC_MAP_EMISSION  20      // Shader location: sampler2d texture: emission
#define    SHADER_LOC_MAP_HEIGHT    21      // Shader location: sampler2d texture: heightmap
#define    SHADER_LOC_MAP_CUBEMAP   22      // Shader location: samplerCube texture: cubemap
#define    SHADER_LOC_MAP_IRRADIANCE  23    // Shader location: samplerCube texture: irradiance
#define    SHADER_LOC_MAP_PREFILTER 24      // Shader location: samplerCube texture: prefilter
#define    SHADER_LOC_MAP_BRDF       25     // Shader location: sampler2d texture: brdf
#define    SHADER_LOC_VERTEX_BONEIDS 26     // Shader location: vertex attribute: bone indices
#define    SHADER_LOC_VERTEX_BONEWEIGHTS 27  // Shader location: vertex attribute: bone weights
#define    SHADER_LOC_MATRIX_BONETRANSFORMS 28 // Shader location: matrix attribute: bone transforms (animation)
#define    SHADER_LOC_VERTEX_INSTANCETRANSFORM 29 // Shader location: vertex attribute: instance transforms

#define SHADER_LOC_MAP_DIFFUSE      SHADER_LOC_MAP_ALBEDO
#define SHADER_LOC_MAP_SPECULAR     SHADER_LOC_MAP_METALNESS

// Shader uniform data type
#define    SHADER_UNIFORM_FLOAT  0       // Shader uniform type: F32
#define    SHADER_UNIFORM_VEC2 1           // Shader uniform type: vec2 (2 F32)
#define    SHADER_UNIFORM_VEC3  2          // Shader uniform type: vec3 (3 F32)
#define    SHADER_UNIFORM_VEC4  3          // Shader uniform type: vec4 (4 F32)
#define    SHADER_UNIFORM_INT   4          // Shader uniform type: I32
#define    SHADER_UNIFORM_IVEC2 5          // Shader uniform type: ivec2 (2 I32)
#define    SHADER_UNIFORM_IVEC3   6        // Shader uniform type: ivec3 (3 I32)
#define    SHADER_UNIFORM_IVEC4   7        // Shader uniform type: ivec4 (4 I32)
#define    SHADER_UNIFORM_UINT   8         // Shader uniform type: U32
#define    SHADER_UNIFORM_UIVEC2 9         // Shader uniform type: uivec2 (2 U32)
#define    SHADER_UNIFORM_UIVEC3  10        // Shader uniform type: uivec3 (3 U32)
#define    SHADER_UNIFORM_UIVEC4  11        // Shader uniform type: uivec4 (4 U32)
#define    SHADER_UNIFORM_SAMPLER2D  12      // Shader uniform type: sampler2d


// Shader attribute data types
#define    SHADER_ATTRIB_FLOAT  0        // Shader attribute type: F32
#define    SHADER_ATTRIB_VEC2   1          // Shader attribute type: vec2 (2 F32)
#define    SHADER_ATTRIB_VEC3   2          // Shader attribute type: vec3 (3 F32)
#define    SHADER_ATTRIB_VEC4   3           // Shader attribute type: vec4 (4 F32)

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
#define    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE  1 // 8 bit per pixel (no alpha)
#define    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA 2   // 8*2 bpp (2 channels)
#define    PIXELFORMAT_UNCOMPRESSED_R5G6B5 3       // 16 bpp
#define    PIXELFORMAT_UNCOMPRESSED_R8G8B8 4      // 24 bpp
#define    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 5     // 16 bpp (1 bit alpha)
#define    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 6     // 16 bpp (4 bit alpha)
#define    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 7     // 32 bpp
#define    PIXELFORMAT_UNCOMPRESSED_R32 8          // 32 bpp (1 channel - F32)
#define    PIXELFORMAT_UNCOMPRESSED_R32G32B32 9    // 32*3 bpp (3 channels - F32)
#define    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 10  // 32*4 bpp (4 channels - F32)
#define    PIXELFORMAT_UNCOMPRESSED_R16 12          // 16 bpp (1 channel - half F32)
#define    PIXELFORMAT_UNCOMPRESSED_R16G16B16 13    // 16*3 bpp (3 channels - half F32)
#define    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 14 // 16*4 bpp (4 channels - half F32)
#define    PIXELFORMAT_COMPRESSED_DXT1_RGB 15       // 4 bpp (no alpha)
#define    PIXELFORMAT_COMPRESSED_DXT1_RGBA 16      // 4 bpp (1 bit alpha)
#define    PIXELFORMAT_COMPRESSED_DXT3_RGBA 17      // 8 bpp
#define    PIXELFORMAT_COMPRESSED_DXT5_RGBA 18      // 8 bpp
#define    PIXELFORMAT_COMPRESSED_ETC1_RGB 19       // 4 bpp
#define    PIXELFORMAT_COMPRESSED_ETC2_RGB 20       // 4 bpp
#define    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA 21  // 8 bpp
#define    PIXELFORMAT_COMPRESSED_PVRT_RGB 22       // 4 bpp
#define    PIXELFORMAT_COMPRESSED_PVRT_RGBA 23      // 4 bpp
#define    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA 24  // 8 bpp
#define    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA 25   // 2 bpp

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
#define    TEXTURE_FILTER_POINT  0               // No filter, pixel approximation
#define    TEXTURE_FILTER_BILINEAR 1               // Linear filtering
#define    TEXTURE_FILTER_TRILINEAR 2              // Trilinear filtering (linear with mipmaps)
#define    TEXTURE_FILTER_ANISOTROPIC_4X 3         // Anisotropic filtering 4x
#define    TEXTURE_FILTER_ANISOTROPIC_8X 4         // Anisotropic filtering 8x
#define    TEXTURE_FILTER_ANISOTROPIC_16X 5        // Anisotropic filtering 16x

// Texture parameters: wrap mode
#define    TEXTURE_WRAP_REPEAT  0                // Repeats texture in tiled mode
#define    TEXTURE_WRAP_CLAMP 1                    // Clamps texture to edge pixel in tiled mode
#define    TEXTURE_WRAP_MIRROR_REPEAT 2            // Mirrors and repeats the texture in tiled mode
#define    TEXTURE_WRAP_MIRROR_CLAMP 3              // Mirrors and clamps to border the texture in tiled mode

// Cubemap layouts
#define    CUBEMAP_LAYOUT_AUTO_DETECT  0         // Automatically detect layout type
#define    CUBEMAP_LAYOUT_LINE_VERTICAL 1          // Layout is defined by a vertical line with faces
#define    CUBEMAP_LAYOUT_LINE_HORIZONTAL 2        // Layout is defined by a horizontal line with faces
#define    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR 3    // Layout is defined by a 3x4 cross with cubemap faces
#define    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE 4    // Layout is defined by a 4x3 cross with cubemap faces


// Font type defines generation method
#define    FONT_DEFAULT  0               // Default font generation, anti-aliased
#define    FONT_BITMAP 1                   // Bitmap font generation, no anti-aliasing
#define    FONT_SDF 2                       // SDF font generation requires external shader

// Color blending modes (pre-defined)
#define    BLEND_ALPHA  0                // Blend textures considering alpha (default)
#define    BLEND_ADDITIVE 1                // Blend textures adding colors
#define    BLEND_MULTIPLIED 2              // Blend textures multiplying colors
#define    BLEND_ADD_COLORS 3              // Blend textures adding colors (alternative)
#define    BLEND_SUBTRACT_COLORS  4        // Blend textures subtracting colors (alternative)
#define    BLEND_ALPHA_PREMULTIPLY 5       // Blend premultiplied textures considering alpha
#define    BLEND_CUSTOM 6                  // Blend textures using custom src/dst factors (use rlSetBlendFactors())
#define    BLEND_CUSTOM_SEPARATE 7          // Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())


// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
#define    GESTURE_NONE         0        // No gesture
#define    GESTURE_TAP          1        // Tap gesture
#define    GESTURE_DOUBLETAP    2        // Double tap gesture
#define    GESTURE_HOLD         4        // Hold gesture
#define    GESTURE_DRAG         8        // Drag gesture
#define    GESTURE_SWIPE_RIGHT  16       // Swipe right gesture
#define    GESTURE_SWIPE_LEFT   32       // Swipe left gesture
#define    GESTURE_SWIPE_UP     64       // Swipe up gesture
#define    GESTURE_SWIPE_DOWN   128      // Swipe down gesture
#define    GESTURE_PINCH_IN     256      // Pinch in gesture
#define    GESTURE_PINCH_OUT    512       // Pinch out gesture


// Camera system modes
#define    CAMERA_CUSTOM  0              // Camera custom, controlled by user (UpdateCamera() does nothing)
#define    CAMERA_FREE     1               // Camera free mode
#define    CAMERA_ORBITAL     2            // Camera orbital, around target, zoom supported
#define    CAMERA_FIRST_PERSON  3          // Camera first person
#define    CAMERA_THIRD_PERSON   4          // Camera third person


// Camera projection
#define    CAMERA_PERSPECTIVE  0         // Perspective projection
#define    CAMERA_ORTHOGRAPHIC    1         // Orthographic projection


// N-patch layout
#define    NPATCH_NINE_PATCH  0          // Npatch layout: 3x3 tiles
#define    NPATCH_THREE_PATCH_VERTICAL  1  // Npatch layout: 1x3 tiles
#define    NPATCH_THREE_PATCH_HORIZONTAL 2  // Npatch layout: 3x1 tiles

// Callbacks to hook some internal functions
// WARNING: These callbacks are intended for advanced users
/* these had typedef, idk how to deal with that. so im ignoring it. 
U0 (*TraceLogCallback)(I32 logLevel,  U8 *text, va_list args); // Logging: Redirect trace log messages
U8 *(*LoadFileDataCallback)( U8 *fileName, I32 *dataSize); // FileIO: Load binary data
Bool (*SaveFileDataCallback)( U8 *fileName,  U0 *data, I32 dataSize); // FileIO: Save binary data
U8 *(*LoadFileTextCallback)( U8 *fileName);                  // FileIO: Load text data
Bool (*SaveFileTextCallback)( U8 *fileName,  U8 *text); // FileIO: Save text data
*/
//------------------------------------------------------------------------------------
// Global Variables Definition
//------------------------------------------------------------------------------------
// It's lonely here...

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------
// Window-related functions
extern "c" U0 InitWindow(I32 width, I32 height,  U8 *title);  // Initialize window and OpenGL context
extern "c" U0 CloseWindow(U0);                                     // Close window and unload OpenGL context
extern "c" Bool WindowShouldClose(U0);                               // Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
extern "c" Bool IsWindowReady(U0);                                   // Check if window has been initialized successfully
extern "c" Bool IsWindowFullscreen(U0);                              // Check if window is currently fullscreen
extern "c" Bool IsWindowHidden(U0);                                  // Check if window is currently hidden
extern "c" Bool IsWindowMinimized(U0);                               // Check if window is currently minimized
extern "c" Bool IsWindowMaximized(U0);                               // Check if window is currently maximized
extern "c" Bool IsWindowFocused(U0);                                 // Check if window is currently focused
extern "c" Bool IsWindowResized(U0);                                 // Check if window has been resized last frame
extern "c" Bool IsWindowState(U32 flag);                      // Check if one specific window flag is enabled
extern "c" U0 SetWindowState(U32 flags);                    // Set window configuration state using flags
extern "c" U0 ClearWindowState(U32 flags);                  // Clear window configuration state flags
extern "c" U0 ToggleFullscreen(U0);                                // Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
extern "c" U0 ToggleBorderlessWindowed(U0);                        // Toggle window state: borderless windowed, resizes window to match monitor resolution
extern "c" U0 MaximizeWindow(U0);                                  // Set window state: maximized, if resizable
extern "c" U0 MinimizeWindow(U0);                                  // Set window state: minimized, if resizable
extern "c" U0 RestoreWindow(U0);                                   // Restore window from being minimized/maximized
extern "c" U0 SetWindowIcon(Image image);                            // Set icon for window (single image, RGBA 32bit)
extern "c" U0 SetWindowIcons(Image *images, I32 count);              // Set icon for window (multiple images, RGBA 32bit)
extern "c" U0 SetWindowTitle( U8 *title);                     // Set title for window
extern "c" U0 SetWindowPosition(I32 x, I32 y);                       // Set window position on screen
extern "c" U0 SetWindowMonitor(I32 monitor);                         // Set monitor for the current window
extern "c" U0 SetWindowMinSize(I32 width, I32 height);               // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
extern "c" U0 SetWindowMaxSize(I32 width, I32 height);               // Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
extern "c" U0 SetWindowSize(I32 width, I32 height);                  // Set window dimensions
extern "c" U0 SetWindowOpacity(F32 opacity);                       // Set window opacity [0.0f..1.0f]
extern "c" U0 SetWindowFocused(U0);                                // Set window focused
extern "c" U0 *GetWindowHandle(U0);                                // Get native window handle
extern "c" I32 GetScreenWidth(U0);                                   // Get current screen width
extern "c" I32 GetScreenHeight(U0);                                  // Get current screen height
extern "c" I32 GetRenderWidth(U0);                                   // Get current render width (it considers HiDPI)
extern "c" I32 GetRenderHeight(U0);                                  // Get current render height (it considers HiDPI)
extern "c" I32 GetMonitorCount(U0);                                  // Get number of connected monitors
extern "c" I32 GetCurrentMonitor(U0);                                // Get current monitor where window is placed
extern "c" Vector2 GetMonitorPosition(I32 monitor);                    // Get specified monitor position
extern "c" I32 GetMonitorWidth(I32 monitor);                           // Get specified monitor width (current video mode used by monitor)
extern "c" I32 GetMonitorHeight(I32 monitor);                          // Get specified monitor height (current video mode used by monitor)
extern "c" I32 GetMonitorPhysicalWidth(I32 monitor);                   // Get specified monitor physical width in millimetres
extern "c" I32 GetMonitorPhysicalHeight(I32 monitor);                  // Get specified monitor physical height in millimetres
extern "c" I32 GetMonitorRefreshRate(I32 monitor);                     // Get specified monitor refresh rate
extern "c" Vector2 GetWindowPosition(U0);                            // Get window position XY on monitor
extern "c" Vector2 GetWindowScaleDPI(U0);                            // Get window scale DPI factor
extern "c"  U8 *GetMonitorName(I32 monitor);                    // Get the human-readable, UTF-8 encoded name of the specified monitor
extern "c" U0 SetClipboardText( U8 *text);                    // Set clipboard text content
extern "c"  U8 *GetClipboardText(U0);                         // Get clipboard text content
extern "c" Image GetClipboardImage(U0);                              // Get clipboard image content
extern "c" U0 EnableEventWaiting(U0);                              // Enable waiting for events on EndDrawing(), no automatic event polling
extern "c" U0 DisableEventWaiting(U0);                             // Disable waiting for events on EndDrawing(), automatic events polling

// Cursor-related functions
extern "c" U0 ShowCursor(U0);                                      // Show cursor
extern "c" U0 HideCursor(U0);                                      // Hide cursor
extern "c" Bool IsCursorHidden(U0);                                  // Check if cursor is not visible
extern "c" U0 EnableCursor(U0);                                    // Enable cursor (unlock cursor)
extern "c" U0 DisableCursor(U0);                                   // Disable cursor (lock cursor)
extern "c" Bool IsCursorOnScreen(U0);                                // Check if cursor is on the screen

// Drawing-related functions
extern "c" U0 ClearBackground(Color color);                          // Clear background (framebuffer) to color
extern "c" U0 BeginDrawing(U0);                                    // Begin canvas (framebuffer) drawing
extern "c" U0 EndDrawing(U0);                                      // End canvas (framebuffer) drawing and swap buffers (F64 buffering)
extern "c" U0 BeginMode2D(Camera2D camera);                          // Begin 2D mode with custom camera (2D)
extern "c" U0 EndMode2D(U0);                                       // End 2D mode with custom camera
extern "c" U0 BeginMode3D(Camera3D camera);                          // Begin 3D mode with custom camera (3D)
extern "c" U0 EndMode3D(U0);                                       // End 3D mode and returns to default 2D orthographic mode
extern "c" U0 BeginTextureMode(RenderTexture target);              // Begin drawing to render texture
extern "c" U0 EndTextureMode(U0);                                  // End drawing to render texture
extern "c" U0 BeginShaderMode(Shader shader);                        // Begin custom shader drawing
extern "c" U0 EndShaderMode(U0);                                   // End custom shader drawing (use default shader)
extern "c" U0 BeginBlendMode(I32 mode);                              // Begin blending mode (alpha, additive, multiplied, subtract, custom)
extern "c" U0 EndBlendMode(U0);                                    // End blending mode (reset to default: alpha blending)
extern "c" U0 BeginScissorMode(I32 x, I32 y, I32 width, I32 height); // Begin scissor mode (define screen area for following drawing)
extern "c" U0 EndScissorMode(U0);                                  // End scissor mode
extern "c" U0 BeginVrStereoMode(VrStereoConfig config);              // Begin stereo rendering (requires VR simulator)
extern "c" U0 EndVrStereoMode(U0);                                 // End stereo rendering (requires VR simulator)

// VR stereo config functions for VR simulator
extern "c" VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);     // Load VR stereo config for VR simulator device parameters
extern "c" U0 UnloadVrStereoConfig(VrStereoConfig config);           // Unload VR stereo config

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
extern "c" Shader LoadShader( U8 *vsFileName,  U8 *fsFileName);   // Load shader from files and bind default locations
extern "c" Shader LoadShaderFromMemory( U8 *vsCode,  U8 *fsCode); // Load shader from code strings and bind default locations
extern "c" Bool IsShaderValid(Shader shader);                                   // Check if shader is valid (loaded on GPU)
extern "c" I32 GetShaderLocation(Shader shader,  U8 *uniformName);       // Get shader uniform location
extern "c" I32 GetShaderLocationAttrib(Shader shader,  U8 *attribName);  // Get shader attribute location
extern "c" U0 SetShaderValue(Shader shader, I32 locIndex,  U0 *value, I32 uniformType); // Set shader uniform value
extern "c" U0 SetShaderValueV(Shader shader, I32 locIndex,  U0 *value, I32 uniformType, I32 count); // Set shader uniform value vector
extern "c" U0 SetShaderValueMatrix(Shader shader, I32 locIndex, Matrix mat);  // Set shader uniform value (matrix 4x4)
extern "c" U0 SetShaderValueTexture(Shader shader, I32 locIndex, Texture texture); // Set shader uniform value and bind the texture (sampler2d)
extern "c" U0 UnloadShader(Shader shader);                                    // Unload shader from GPU memory (VRAM)

// Screen-space-related functions
extern "c" Ray GetScreenToWorldRay(Vector2 position, Camera3D camera);         // Get a ray trace from screen position (i.e mouse)
extern "c" Ray GetScreenToWorldRayEx(Vector2 position, Camera3D camera, I32 width, I32 height); // Get a ray trace from screen position (i.e mouse) in a viewport
extern "c" Vector2 GetWorldToScreen(Vector3 position, Camera3D camera);        // Get screen space position for a 3d world space position
extern "c" Vector2 GetWorldToScreenEx(Vector3 position, Camera3D camera, I32 width, I32 height); // Get sized screen space position for a 3d world space position
extern "c" Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);    // Get screen space position for a 2d camera world space position
extern "c" Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);    // Get world space position for a 2d camera screen space position
extern "c" Matrix GetCameraMatrix(Camera3D camera);                            // Get camera transform matrix (view matrix)
extern "c" Matrix GetCameraMatrix2D(Camera2D camera);                        // Get camera 2d transform matrix

// Timing-related functions
extern "c" U0 SetTargetFPS(I32 fps);                       // Set target FPS (maximum)
extern "c" F32 GetFrameTime(U0);                         // Get time in seconds for last frame drawn (delta time)
extern "c" F64 GetTime(U0);                             // Get elapsed time in seconds since InitWindow()
extern "c" I32 GetFPS(U0);                                 // Get current FPS

// Custom frame control functions
// NOTE: Those functions are intended for advanced users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
extern "c" U0 SwapScreenBuffer(U0);                      // Swap back buffer with front buffer (screen drawing)
extern "c" U0 PollInputEvents(U0);                       // Register all input events
extern "c" U0 WaitTime(F64 seconds);                    // Wait for some time (halt program execution)

// Random values generation functions
extern "c" U0 SetRandomSeed(U32 seed);            // Set the seed for the random number generator
extern "c" I32 GetRandomValue(I32 min, I32 max);             // Get a random value between min and max (both included)
extern "c" I32 *LoadRandomSequence(U32 count, I32 min, I32 max); // Load random values sequence, no values repeated
extern "c" U0 UnloadRandomSequence(I32 *sequence);         // Unload random values sequence

// Misc. functions
extern "c" U0 TakeScreenshot( U8 *fileName);                // Takes a screenshot of current screen (filename extension defines format)
extern "c" U0 SetConfigFlags(U32 flags);                  // Set init configuration flags (view FLAGS)
extern "c" U0 OpenURL( U8 *url);                            // Open URL with default system browser (if available)

// Logging system
extern "c" U0 SetTraceLogLevel(I32 logLevel);                      // Set the current threshold (minimum) log level
extern "c" U0 TraceLog(I32 logLevel,  U8 *text, ...);       // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
//extern "c" U0 SetTraceLogCallback(TraceLogCallback callback);      // Set custom trace log ??FIND??

// Memory management, using internal allocators
extern "c" U0 *MemAlloc(U32 size);                        // Internal memory allocator
extern "c" U0 *MemRealloc(U0 *ptr, U32 size);           // Internal memory reallocator
extern "c" U0 MemFree(U0 *ptr);                                  // Internal memory free

// File system management functions
extern "c" U8 *LoadFileData( U8 *fileName, I32 *dataSize); // Load file data as byte array (read)
extern "c" U0 UnloadFileData(U8 *data);                     // Unload file data allocated by LoadFileData()
extern "c" Bool SaveFileData( U8 *fileName,  U0 *data, I32 dataSize); // Save data to file from byte array (write), returns true on success
extern "c" Bool ExportDataAsCode( U8 *data, I32 dataSize,  U8 *fileName); // Export data to code (.h), returns true on success
extern "c" U8 *LoadFileText( U8 *fileName);                     // Load text data from file (read), returns a '\0' terminated string
extern "c" U0 UnloadFileText(U8 *text);                              // Unload file text data allocated by LoadFileText()
extern "c" Bool SaveFileText( U8 *fileName,  U8 *text);    // Save text data to file (write), string must be '\0' terminated, returns true on success

// File access custom callbacks
// WARNING: Callbacks setup is intended for advanced users. these require some things up at 800 lines. idk how it works so im leaving it out. ??FIND??
/*
extern "c" U0 SetLoadFileDataCallback(LoadFileDataCallback callback);  // Set custom file binary data loader
extern "c" U0 SetSaveFileDataCallback(SaveFileDataCallback callback);  // Set custom file binary data saver
extern "c" U0 SetLoadFileTextCallback(LoadFileTextCallback callback);  // Set custom file text data loader
extern "c" U0 SetSaveFileTextCallback(SaveFileTextCallback callback);  // Set custom file text data saver
*/

extern "c" I32 FileRename( U8 *fileName,  U8 *fileRename); // Rename file (if exists), returns 0 on success
extern "c" I32 FileRemove( U8 *fileName);                         // Remove file (if exists), returns 0 on success
extern "c" I32 FileCopy( U8 *srcPath,  U8 *dstPath);       // Copy file from one path to another, dstPath created if it doesn't exist, returns 0 on success
extern "c" I32 FileMove( U8 *srcPath,  U8 *dstPath);       // Move file from one directory to another, dstPath created if it doesn't exist, returns 0 on success
extern "c" I32 FileTextReplace( U8 *fileName,  U8 *search,  U8 *replacement); // Replace text in an existing file, returns 0 on success
extern "c" I32 FileTextFindIndex( U8 *fileName,  U8 *search); // Find text in existing file, returns -1 if index not found or index otherwise
extern "c" Bool FileExists( U8 *fileName);                        // Check if file exists
extern "c" Bool DirectoryExists( U8 *dirPath);                    // Check if directory path exists
extern "c" Bool IsFileExtension( U8 *fileName,  U8 *ext);  // Check file extension (recommended include point: .png, .wav)
extern "c" Bool IsFileHidden( U8 *filePath);                      // Check if file path (file or directory) is hidden by OS
extern "c" I32 GetFileLength( U8 *fileName);                      // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
extern "c" I64 GetFileModTime( U8 *fileName);                    // Get file modification time (last write time)
extern "c"  U8 *GetFileExtension( U8 *fileName);           // Get pointer to extension for a filename string (includes dot: '.png')
extern "c"  U8 *GetFileName( U8 *filePath);                // Get pointer to filename for a path string
extern "c"  U8 *GetFileNameWithoutExt( U8 *filePath);      // Get filename string without extension (uses static string)
extern "c"  U8 *GetDirectoryPath( U8 *filePath);           // Get full path for a provided fileName with path (uses static string)
extern "c"  U8 *GetPrevDirectoryPath( U8 *dirPath);        // Get previous directory path for a provided path (uses static string)
extern "c"  U8 *GetWorkingDirectory(U0);                        // Get current working directory (uses static string)
extern "c"  U8 *GetApplicationDirectory(U0);                    // Get the directory of the running application (uses static string)
extern "c" I32 MakeDirectory( U8 *dirPath);                       // Create directories (including full path requested), returns 0 on success
extern "c" I32 ChangeDirectory( U8 *dirPath);                     // Change working directory, returns 0 on success
extern "c" Bool IsPathFile( U8 *path);                            // Check if provided path points to a file
extern "c" Bool IsPathDirectory( U8 *path);                       // Check if provided path points to a directory
extern "c" Bool IsPathAbsolute( U8 *path);                        // Check if provided path is an absolute path
extern "c" Bool IsFileNameValid( U8 *fileName);                   // Check if fileName is valid for the platform/OS
extern "c" FilePathList LoadDirectoryFiles( U8 *dirPath);         // Load directory filepaths, files and directories, no subdirs scan
extern "c" FilePathList LoadDirectoryFilesEx( U8 *basePath,  U8 *filter, Bool scanSubdirs); // Load directory filepaths with extension filtering and subdir scan; some filters available: '*.*','FILES*','DIRS*'
extern "c" U0 UnloadDirectoryFiles(FilePathList files);                // Unload filepaths
extern "c" Bool IsFileDropped(U0);                                     // Check if file has been dropped into window
extern "c" FilePathList LoadDroppedFiles(U0);                          // Load dropped filepaths
extern "c" U0 UnloadDroppedFiles(FilePathList files);                  // Unload dropped filepaths
extern "c" U32 GetDirectoryFileCount( U8 *dirPath);      // Get the file count in a directory
extern "c" U32 GetDirectoryFileCountEx( U8 *basePath,  U8 *filter, Bool scanSubdirs); // Get the file count in a directory with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result

// Compression/Encoding functionality
extern "c" U8 *CompressData( U8 *data, I32 dataSize, I32 *compDataSize);        // Compress data (DEFLATE algorithm), memory must be MemFree()
extern "c" U8 *DecompressData( U8 *compData, I32 compDataSize, I32 *dataSize);  // Decompress data (DEFLATE algorithm), memory must be MemFree()
extern "c" U8 *EncodeDataBase64( U8 *data, I32 dataSize, I32 *outputSize);               // Encode data to Base64 string (includes NULL terminator), memory must be MemFree()
extern "c" U8 *DecodeDataBase64( U8 *text, I32 *outputSize);                             // Decode Base64 string (expected NULL terminated), memory must be MemFree()
extern "c" U32 ComputeCRC32( U8 *data, I32 dataSize); // Compute CRC32 hash code
extern "c" U32 *ComputeMD5( U8 *data, I32 dataSize);  // Compute MD5 hash code, returns static I32[4] (16 bytes)
extern "c" U32 *ComputeSHA1( U8 *data, I32 dataSize); // Compute SHA1 hash code, returns static I32[5] (20 bytes)
extern "c" U32 *ComputeSHA256( U8 *data, I32 dataSize); // Compute SHA256 hash code, returns static I32[8] (32 bytes)

// Automation events functionality
extern "c" AutomationEventList LoadAutomationEventList( U8 *fileName); // Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
extern "c" U0 UnloadAutomationEventList(AutomationEventList list);   // Unload automation events list from file
extern "c" Bool ExportAutomationEventList(AutomationEventList list,  U8 *fileName); // Export automation events list as text file
extern "c" U0 SetAutomationEventList(AutomationEventList *list);     // Set automation event list to record to
extern "c" U0 SetAutomationEventBaseFrame(I32 frame);                // Set automation event internal base frame to start recording
extern "c" U0 StartAutomationEventRecording(U0);                   // Start recording automation events (AutomationEventList must be set)
extern "c" U0 StopAutomationEventRecording(U0);                    // Stop recording automation events
extern "c" U0 PlayAutomationEvent(AutomationEvent event);            // Play a recorded automation event

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard
extern "c" Bool IsKeyPressed(I32 key);                             // Check if key has been pressed once
extern "c" Bool IsKeyPressedRepeat(I32 key);                       // Check if key has been pressed again
extern "c" Bool IsKeyDown(I32 key);                                // Check if key is being pressed
extern "c" Bool IsKeyReleased(I32 key);                            // Check if key has been released once
extern "c" Bool IsKeyUp(I32 key);                                  // Check if key is NOT being pressed
extern "c" I32 GetKeyPressed(U0);                                // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
extern "c" I32 GetCharPressed(U0);                               // Get U8 pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
extern "c"  U8 *GetKeyName(I32 key);                        // Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
extern "c" U0 SetExitKey(I32 key);                               // Set a custom key to exit program (default is ESC)

// Input-related functions: gamepads
extern "c" Bool IsGamepadAvailable(I32 gamepad);                   // Check if gamepad is available
extern "c"  U8 *GetGamepadName(I32 gamepad);                // Get gamepad internal name id
extern "c" Bool IsGamepadButtonPressed(I32 gamepad, I32 button);   // Check if gamepad button has been pressed once
extern "c" Bool IsGamepadButtonDown(I32 gamepad, I32 button);      // Check if gamepad button is being pressed
extern "c" Bool IsGamepadButtonReleased(I32 gamepad, I32 button);  // Check if gamepad button has been released once
extern "c" Bool IsGamepadButtonUp(I32 gamepad, I32 button);        // Check if gamepad button is NOT being pressed
extern "c" I32 GetGamepadButtonPressed(U0);                      // Get the last gamepad button pressed
extern "c" I32 GetGamepadAxisCount(I32 gamepad);                   // Get axis count for a gamepad
extern "c" F32 GetGamepadAxisMovement(I32 gamepad, I32 axis);    // Get movement value for a gamepad axis
extern "c" I32 SetGamepadMappings( U8 *mappings);           // Set internal gamepad mappings (SDL_GameControllerDB)
extern "c" U0 SetGamepadVibration(I32 gamepad, F32 leftMotor, F32 rightMotor, F32 duration); // Set gamepad vibration for both motors (duration in seconds)

// Input-related functions: mouse
extern "c" Bool IsMouseButtonPressed(I32 button);                  // Check if mouse button has been pressed once
extern "c" Bool IsMouseButtonDown(I32 button);                     // Check if mouse button is being pressed
extern "c" Bool IsMouseButtonReleased(I32 button);                 // Check if mouse button has been released once
extern "c" Bool IsMouseButtonUp(I32 button);                       // Check if mouse button is NOT being pressed
extern "c" I32 GetMouseX(U0);                                    // Get mouse position X
extern "c" I32 GetMouseY(U0);                                    // Get mouse position Y
extern "c" Vector2 GetMousePosition(U0);                         // Get mouse position XY
extern "c" Vector2 GetMouseDelta(U0);                            // Get mouse delta between frames
extern "c" U0 SetMousePosition(I32 x, I32 y);                    // Set mouse position XY
extern "c" U0 SetMouseOffset(I32 offsetX, I32 offsetY);          // Set mouse offset
extern "c" U0 SetMouseScale(F32 scaleX, F32 scaleY);         // Set mouse scaling
extern "c" F32 GetMouseWheelMove(U0);                          // Get mouse wheel movement for X or Y, whichever is larger
extern "c" Vector2 GetMouseWheelMoveV(U0);                       // Get mouse wheel movement for both X and Y
extern "c" U0 SetMouseCursor(I32 cursor);                        // Set mouse cursor

// Input-related functions: touch
extern "c" I32 GetTouchX(U0);                                    // Get touch position X for touch point 0 (relative to screen size)
extern "c" I32 GetTouchY(U0);                                    // Get touch position Y for touch point 0 (relative to screen size)
extern "c" Vector2 GetTouchPosition(I32 index);                    // Get touch position XY for a touch point index (relative to screen size)
extern "c" I32 GetTouchPointId(I32 index);                         // Get touch point identifier for provided index
extern "c" I32 GetTouchPointCount(U0);                           // Get number of touch points

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------
extern "c" U0 SetGesturesEnabled(U32 flags);            // Enable a set of gestures using flags
extern "c" Bool IsGestureDetected(U32 gesture);           // Check if gesture has been detected
extern "c" I32 GetGestureDetected(U0);                           // Get latest detected gesture
extern "c" F32 GetGestureHoldDuration(U0);                     // Get gesture hold time in seconds
extern "c" Vector2 GetGestureDragVector(U0);                     // Get gesture drag vector
extern "c" F32 GetGestureDragAngle(U0);                        // Get gesture drag angle
extern "c" Vector2 GetGesturePinchVector(U0);                    // Get gesture pinch delta
extern "c" F32 GetGesturePinchAngle(U0);                       // Get gesture pinch angle

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------
extern "c" U0 UpdateCamera(Camera3D *camera, I32 mode);            // Update camera position for selected mode
extern "c" U0 UpdateCameraPro(Camera3D *camera, Vector3 movement, Vector3 rotation, F32 zoom); // Update camera movement/rotation

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------
// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font U8 white rectangle would allow drawing everything in a single draw call
extern "c" U0 SetShapesTexture(Texture texture, Rectangle rec); // Set texture and rectangle to be used on shapes drawing
extern "c" Texture GetShapesTexture(U0);                 // Get texture that is used for shapes drawing
extern "c" Rectangle GetShapesTextureRectangle(U0);        // Get texture source rectangle that is used for shapes drawing

// Basic shapes drawing functions
extern "c" U0 DrawPixel(I32 posX, I32 posY, Color color);                                                   // Draw a pixel using geometry [Can be slow, use with care]
extern "c" U0 DrawPixelV(Vector2 position, Color color);                                                    // Draw a pixel using geometry (Vector version) [Can be slow, use with care]
extern "c" U0 DrawLine(I32 startPosX, I32 startPosY, I32 endPosX, I32 endPosY, Color color);                // Draw a line
extern "c" U0 DrawLineV(Vector2 startPos, Vector2 endPos, Color color);                                     // Draw a line (using gl lines)
extern "c" U0 DrawLineEx(Vector2 startPos, Vector2 endPos, F32 thick, Color color);                       // Draw a line (using triangles/quads)
extern "c" U0 DrawLineStrip( Vector2 *points, I32 pointCount, Color color);                            // Draw lines sequence (using gl lines)
extern "c" U0 DrawLineBezier(Vector2 startPos, Vector2 endPos, F32 thick, Color color);                   // Draw line segment cubic-bezier in-out interpolation
extern "c" U0 DrawLineDashed(Vector2 startPos, Vector2 endPos, I32 dashSize, I32 spaceSize, Color color);   // Draw a dashed line
extern "c" U0 DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle, counter-clockwise vertex order
extern "c" U0 DrawTriangleGradient(Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3);       // Draw triangle with interpolated colors, counter-clockwise vertex/color order
extern "c" U0 DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline, counter-clockwise vertex order
extern "c" U0 DrawTriangleLinesEx(Vector2 v1, Vector2 v2, Vector2 v3, F32 thick, Color color);            // Draw triangle outline with line thickness, counter-clockwise vertex order
extern "c" U0 DrawTriangleFan( Vector2 *points, I32 pointCount, Color color);                          // Draw a triangle fan defined by points (first vertex is the center)
extern "c" U0 DrawTriangleStrip( Vector2 *points, I32 pointCount, Color color);                        // Draw a triangle strip defined by points
extern "c" U0 DrawRectangle(I32 posX, I32 posY, I32 width, I32 height, Color color);                        // Draw a color-filled rectangle
extern "c" U0 DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version)
extern "c" U0 DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle
extern "c" U0 DrawRectanglePro(Rectangle rec, Vector2 origin, F32 rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
extern "c" U0 DrawRectangleGradientV(I32 posX, I32 posY, I32 width, I32 height, Color top, Color bottom);   // Draw a vertical-gradient-filled rectangle
extern "c" U0 DrawRectangleGradientH(I32 posX, I32 posY, I32 width, I32 height, Color left, Color right);   // Draw a horizontal-gradient-filled rectangle
extern "c" U0 DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors, counter-clockwise color order
extern "c" U0 DrawRectangleLines(I32 posX, I32 posY, I32 width, I32 height, Color color);                   // Draw rectangle outline
extern "c" U0 DrawRectangleLinesEx(Rectangle rec, F32 thick, Color color);                                // Draw rectangle outline with line thickness
extern "c" U0 DrawRectangleRounded(Rectangle rec, F32 roundness, I32 segments, Color color);              // Draw rectangle with rounded edges
extern "c" U0 DrawRectangleRoundedLines(Rectangle rec, F32 roundness, I32 segments, Color color);         // Draw rectangle lines with rounded edges
extern "c" U0 DrawRectangleRoundedLinesEx(Rectangle rec, F32 roundness, I32 segments, F32 thick, Color color); // Draw rectangle lines with rounded edges outline and line thickness
extern "c" U0 DrawPoly(Vector2 center, I32 sides, F32 radius, F32 rotation, Color color);               // Draw a polygon of n sides
extern "c" U0 DrawPolyLines(Vector2 center, I32 sides, F32 radius, F32 rotation, Color color);          // Draw a polygon outline of n sides
extern "c" U0 DrawPolyLinesEx(Vector2 center, I32 sides, F32 radius, F32 rotation, F32 thick, Color color); // Draw a polygon outline of n sides with line thickness
extern "c" U0 DrawCircle(I32 centerX, I32 centerY, F32 radius, Color color);                              // Draw a color-filled circle
extern "c" U0 DrawCircleV(Vector2 center, F32 radius, Color color);                                       // Draw a color-filled circle (Vector version)
extern "c" U0 DrawCircleGradient(Vector2 center, F32 radius, Color inner, Color outer);                   // Draw a gradient-filled circle
extern "c" U0 DrawCircleSector(Vector2 center, F32 radius, F32 startAngle, F32 endAngle, I32 segments, Color color); // Draw a piece of a circle
extern "c" U0 DrawCircleSectorLines(Vector2 center, F32 radius, F32 startAngle, F32 endAngle, I32 segments, Color color); // Draw circle sector outline
extern "c" U0 DrawCircleSectorLinesEx(Vector2 center, F32 radius, F32 startAngle, F32 endAngle, I32 segments, F32 thick, Color color); // Draw circle sector outline with thickness
extern "c" U0 DrawCircleLines(I32 centerX, I32 centerY, F32 radius, Color color);                         // Draw circle outline
extern "c" U0 DrawCircleLinesV(Vector2 center, F32 radius, Color color);                                  // Draw circle outline (Vector version)
extern "c" U0 DrawCircleLinesEx(Vector2 center, F32 radius, F32 thick, Color color);                    // Draw circle outline with line thickness
extern "c" U0 DrawEllipse(I32 centerX, I32 centerY, F32 radiusH, F32 radiusV, Color color);             // Draw ellipse
extern "c" U0 DrawEllipseV(Vector2 center, F32 radiusH, F32 radiusV, Color color);                      // Draw ellipse (Vector version)
extern "c" U0 DrawEllipseLines(I32 centerX, I32 centerY, F32 radiusH, F32 radiusV, Color color);        // Draw ellipse outline
extern "c" U0 DrawEllipseLinesV(Vector2 center, F32 radiusH, F32 radiusV, Color color);                 // Draw ellipse outline (Vector version)
extern "c" U0 DrawEllipseLinesEx(Vector2 center, F32 radiusH, F32 radiusV, F32 thick, Color color);   // Draw ellipse outline with line thickness
extern "c" U0 DrawRing(Vector2 center, F32 innerRadius, F32 outerRadius, F32 startAngle, F32 endAngle, I32 segments, Color color); // Draw ring
extern "c" U0 DrawRingLines(Vector2 center, F32 innerRadius, F32 outerRadius, F32 startAngle, F32 endAngle, I32 segments, Color color); // Draw ring outline
extern "c" U0 DrawRingLinesEx(Vector2 center, F32 innerRadius, F32 outerRadius, F32 startAngle, F32 endAngle, I32 segments, F32 thick, Color color); // Draw ring outline with line thickness

// Splines drawing functions
extern "c" U0 DrawSplineLinear( Vector2 *points, I32 pointCount, F32 thick, Color color);            // Draw spline: Linear, minimum 2 points
extern "c" U0 DrawSplineBasis( Vector2 *points, I32 pointCount, F32 thick, Color color);             // Draw spline: B-Spline, minimum 4 points
extern "c" U0 DrawSplineCatmullRom( Vector2 *points, I32 pointCount, F32 thick, Color color);        // Draw spline: Catmull-Rom, minimum 4 points
extern "c" U0 DrawSplineBezierQuadratic( Vector2 *points, I32 pointCount, F32 thick, Color color);   // Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
extern "c" U0 DrawSplineBezierCubic( Vector2 *points, I32 pointCount, F32 thick, Color color);       // Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
extern "c" U0 DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, F32 thick, Color color);                    // Draw spline segment: Linear, 2 points
extern "c" U0 DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, F32 thick, Color color); // Draw spline segment: B-Spline, 4 points
extern "c" U0 DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, F32 thick, Color color); // Draw spline segment: Catmull-Rom, 4 points
extern "c" U0 DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, F32 thick, Color color); // Draw spline segment: Quadratic Bezier, 2 points, 1 control point
extern "c" U0 DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, F32 thick, Color color); // Draw spline segment: Cubic Bezier, 2 points, 2 control points

// Spline segment point evaluation functions, for a provided t [0.0f .. 1.0f]
extern "c" Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, F32 t);                           // Get (evaluate) spline point: Linear
extern "c" Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, F32 t);              // Get (evaluate) spline point: B-Spline
extern "c" Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, F32 t);         // Get (evaluate) spline point: Catmull-Rom
extern "c" Vector2 GetSplinePointBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, F32 t);                // Get (evaluate) spline point: Quadratic Bezier
extern "c" Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, F32 t);        // Get (evaluate) spline point: Cubic Bezier

// Basic shapes collision detection functions
extern "c" Bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles
extern "c" Bool CheckCollisionCircles(Vector2 center1, F32 radius1, Vector2 center2, F32 radius2);        // Check collision between two circles
extern "c" Bool CheckCollisionCircleRec(Vector2 center, F32 radius, Rectangle rec);                         // Check collision between circle and rectangle
extern "c" Bool CheckCollisionCircleLine(Vector2 center, F32 radius, Vector2 p1, Vector2 p2);               // Check if circle collides with a line created between two points [p1] and [p2]
extern "c" Bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
extern "c" Bool CheckCollisionPointCircle(Vector2 point, Vector2 center, F32 radius);                       // Check if point is inside circle
extern "c" Bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle
extern "c" Bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, I32 threshold);                // Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
extern "c" Bool CheckCollisionPointPoly(Vector2 point,  Vector2 *points, I32 pointCount);                // Check if point is within a polygon described by array of vertices
extern "c" Bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference
extern "c" Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);                                         // Get collision rectangle for two rectangles collision

//------------------------------------------------------------------------------------
// Texture Loading and Drawing Functions (Module: textures)
//------------------------------------------------------------------------------------

// Image loading functions
// NOTE: These functions do not require GPU access
extern "c" Image LoadImage( U8 *fileName);                                                             // Load image from file into CPU memory (RAM)
extern "c" Image LoadImageRaw( U8 *fileName, I32 width, I32 height, I32 format, I32 headerSize);       // Load image from RAW file data
extern "c" Image LoadImageAnim( U8 *fileName, I32 *frames);                                            // Load image sequence from file (frames appended to image.data)
extern "c" Image LoadImageAnimFromMemory( U8 *fileType,  U8 *fileData, I32 dataSize, I32 *frames); // Load image sequence from memory buffer
extern "c" Image LoadImageFromMemory( U8 *fileType,  U8 *fileData, I32 dataSize);      // Load image from memory buffer, fileType refers to extension: i.e. '.png'
extern "c" Image LoadImageFromTexture(Texture texture);                                                     // Load image from GPU texture data
extern "c" Image LoadImageFromScreen(U0);                                                                   // Load image from screen buffer (screenshot)
extern "c" Bool IsImageValid(Image image);                                                                    // Check if an image is valid (data and parameters)
extern "c" U0 UnloadImage(Image image);                                                                     // Unload image from CPU memory (RAM)
extern "c" Bool ExportImage(Image image,  U8 *fileName);                                               // Export image data to file, returns true on success
extern "c" U8 *ExportImageToMemory(Image image,  U8 *fileType, I32 *fileSize);              // Export image to memory buffer, memory must be MemFree()
extern "c" Bool ExportImageAsCode(Image image,  U8 *fileName);                                         // Export image as code file defining an array of bytes, returns true on success

// Image generation functions
extern "c" Image GenImageColor(I32 width, I32 height, Color color);                                           // Generate image: plain color
extern "c" Image GenImageGradientLinear(I32 width, I32 height, I32 direction, Color start, Color end);        // Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
extern "c" Image GenImageGradientRadial(I32 width, I32 height, F32 density, Color inner, Color outer);      // Generate image: radial gradient
extern "c" Image GenImageGradientSquare(I32 width, I32 height, F32 density, Color inner, Color outer);      // Generate image: square gradient
extern "c" Image GenImageChecked(I32 width, I32 height, I32 checksX, I32 checksY, Color col1, Color col2);    // Generate image: checked
extern "c" Image GenImageWhiteNoise(I32 width, I32 height, F32 factor);                                     // Generate image: white noise
extern "c" Image GenImagePerlinNoise(I32 width, I32 height, I32 offsetX, I32 offsetY, F32 scale);           // Generate image: perlin noise
extern "c" Image GenImageCellular(I32 width, I32 height, I32 tileSize);                                       // Generate image: cellular algorithm, bigger tileSize means bigger cells
extern "c" Image GenImageText(I32 width, I32 height,  U8 *text);                                       // Generate image: grayscale image from text data

// Image manipulation functions
extern "c" Image ImageCopy(Image image);                                                                      // Create an image duplicate (useful for transformations)
extern "c" Image ImageFromImage(Image image, Rectangle rec);                                                  // Create an image from another image piece
extern "c" Image ImageFromChannel(Image image, I32 selectedChannel);                                          // Create an image from a selected channel of another image (GRAYSCALE)
extern "c" Image ImageText( U8 *text, I32 fontSize, Color color);                                      // Create an image from text (default font)
extern "c" Image ImageTextEx(Font font,  U8 *text, F32 fontSize, F32 spacing, Color tint);         // Create an image from text (custom sprite font)
extern "c" U0 ImageFormat(Image *image, I32 newFormat);                                                     // Convert image data to desired format
extern "c" U0 ImageToPOT(Image *image, Color fill);                                                         // Convert image to POT (power-of-two)
extern "c" U0 ImageCrop(Image *image, Rectangle crop);                                                      // Crop an image to a defined rectangle
extern "c" U0 ImageAlphaCrop(Image *image, F32 threshold);                                                // Crop image depending on alpha value
extern "c" U0 ImageAlphaClear(Image *image, Color color, F32 threshold);                                  // Clear alpha channel to desired color
extern "c" U0 ImageAlphaMask(Image *image, Image alphaMask);                                                // Apply alpha mask to image
extern "c" U0 ImageAlphaPremultiply(Image *image);                                                          // Premultiply alpha channel
extern "c" U0 ImageBlurGaussian(Image *image, I32 blurSize);                                                // Apply Gaussian blur using a box blur approximation
extern "c" U0 ImageKernelConvolution(Image *image,  F32 *kernel, I32 kernelSize);                    // Apply custom square convolution kernel to image
extern "c" U0 ImageResize(Image *image, I32 newWidth, I32 newHeight);                                       // Resize image (Bicubic scaling algorithm)
extern "c" U0 ImageResizeNN(Image *image, I32 newWidth, I32 newHeight);                                     // Resize image (Nearest-Neighbor scaling algorithm)
extern "c" U0 ImageResizeCanvas(Image *image, I32 newWidth, I32 newHeight, I32 offsetX, I32 offsetY, Color fill); // Resize canvas and fill with color
extern "c" U0 ImageMipmaps(Image *image);                                                                   // Compute all mipmap levels for a provided image
extern "c" U0 ImageDither(Image *image, I32 rBpp, I32 gBpp, I32 bBpp, I32 aBpp);                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
extern "c" U0 ImageFlipVertical(Image *image);                                                              // Flip image vertically
extern "c" U0 ImageFlipHorizontal(Image *image);                                                            // Flip image horizontally
extern "c" U0 ImageRotate(Image *image, I32 degrees);                                                       // Rotate image by input angle in degrees (-359 to 359)
extern "c" U0 ImageRotateCW(Image *image);                                                                  // Rotate image clockwise 90deg
extern "c" U0 ImageRotateCCW(Image *image);                                                                 // Rotate image counter-clockwise 90deg
extern "c" U0 ImageColorTint(Image *image, Color color);                                                    // Modify image color: tint
extern "c" U0 ImageColorInvert(Image *image);                                                               // Modify image color: invert
extern "c" U0 ImageColorGrayscale(Image *image);                                                            // Modify image color: grayscale
extern "c" U0 ImageColorContrast(Image *image, I32 contrast);                                               // Modify image color: contrast (-100 to 100)
extern "c" U0 ImageColorBrightness(Image *image, I32 brightness);                                           // Modify image color: brightness (-255 to 255)
extern "c" U0 ImageColorReplace(Image *image, Color color, Color replace);                                  // Modify image color: replace color
extern "c" Color *LoadImageColors(Image image);                                                               // Load color data from image as a Color array (RGBA - 32bit)
extern "c" Color *LoadImagePalette(Image image, I32 maxPaletteSize, I32 *colorCount);                         // Load colors palette from image as a Color array (RGBA - 32bit)
extern "c" U0 UnloadImageColors(Color *colors);                                                             // Unload color data loaded with LoadImageColors()
extern "c" U0 UnloadImagePalette(Color *colors);                                                            // Unload colors palette loaded with LoadImagePalette()
extern "c" Rectangle GetImageAlphaBorder(Image image, F32 threshold);                                       // Get image alpha border rectangle
extern "c" Color GetImageColor(Image image, I32 x, I32 y);                                                    // Get image pixel color at (x, y) position

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
extern "c" U0 ImageClearBackground(Image *dst, Color color);                                                // Clear image background with provided color
extern "c" U0 ImageDrawPixel(Image *dst, I32 posX, I32 posY, Color color);                                  // Draw pixel within an image
extern "c" U0 ImageDrawPixelV(Image *dst, Vector2 position, Color color);                                   // Draw pixel within an image (Vector version)
extern "c" U0 ImageDrawLine(Image *dst, I32 startPosX, I32 startPosY, I32 endPosX, I32 endPosY, Color color); // Draw line within an image
extern "c" U0 ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);                          // Draw line within an image (Vector version)
extern "c" U0 ImageDrawLineEx(Image *dst, Vector2 start, Vector2 end, I32 thick, Color color);              // Draw a line defining thickness within an image
extern "c" U0 ImageDrawLineStrip(Image *dst,  Vector2 *points, I32 pointCount, Color color);           // Draw a lines sequence within an image
extern "c" U0 ImageDrawTriangle(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);               // Draw triangle within an image
extern "c" U0 ImageDrawTriangleGradient(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3); // Draw triangle with interpolated colors within an image
extern "c" U0 ImageDrawTriangleLines(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);          // Draw triangle outline within an image
extern "c" U0 ImageDrawTriangleFan(Image *dst,  Vector2 *points, I32 pointCount, Color color);         // Draw a triangle fan defined by points within an image (first vertex is the center)
extern "c" U0 ImageDrawTriangleStrip(Image *dst,  Vector2 *points, I32 pointCount, Color color);       // Draw a triangle strip defined by points within an image
extern "c" U0 ImageDrawRectangle(Image *dst, I32 posX, I32 posY, I32 width, I32 height, Color color);       // Draw rectangle within an image
extern "c" U0 ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);                 // Draw rectangle within an image (Vector version)
extern "c" U0 ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);                                // Draw rectangle within an image
extern "c" U0 ImageDrawRectanglePro(Image *dst, Rectangle rec, Vector2 origin, F32 rotation, Color color); // Draw a color-filled rectangle with pro parameters within and image
extern "c" U0 ImageDrawRectangleLines(Image *dst, I32 posX, I32 posY, I32 width, I32 height, Color color);  // Draw rectangle lines within an image
extern "c" U0 ImageDrawRectangleLinesEx(Image *dst, Rectangle rec, I32 thick, Color color);                 // Draw rectangle lines within an image with line thickness
extern "c" U0 ImageDrawRectangleGradientEx(Image *dst, Rectangle rec, Color col1, Color col2, Color col3, Color col4); // Draw rectangle with gradient colors within an image, counter-clockwise color order
extern "c" U0 ImageDrawCircle(Image *dst, I32 centerX, I32 centerY, I32 radius, Color color);               // Draw a filled circle within an image
extern "c" U0 ImageDrawCircleV(Image *dst, Vector2 center, I32 radius, Color color);                        // Draw a filled circle within an image (Vector version)
extern "c" U0 ImageDrawCircleLines(Image *dst, I32 centerX, I32 centerY, I32 radius, Color color);          // Draw circle outline within an image
extern "c" U0 ImageDrawCircleLinesV(Image *dst, Vector2 center, I32 radius, Color color);                   // Draw circle outline within an image (Vector version)
extern "c" U0 ImageDrawCircleGradient(Image *dst, Vector2 center, F32 radius, Color inner, Color outer);  // Draw a gradient-filled circle within an image

extern "c" U0 ImageDrawImage(Image *dst, Image src, I32 posX, I32 posY, Color tint);                      // Draw an image within an image
extern "c" U0 ImageDrawImageEx(Image *dst, Image src, Vector2 position, F32 rotation, F32 scale, Color tint); // Draw an image with scaling and rotation within an image
extern "c" U0 ImageDrawImageRec(Image *dst, Image src, Rectangle srcRec, Vector2 position, Color tint);     // Draw a part of an image defined by a rectangle within an image
extern "c" U0 ImageDrawImagePro(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Vector2 origin, F32 rotation, Color tint); // Draw a part of an image defined by a rectangle into destination rectangle, with scaling and rotation, within an image
extern "c" U0 ImageDrawText(Image *dst,  U8 *text, I32 posX, I32 posY, I32 fontSize, Color color);   // Draw text (using default font) within an image (destination)
extern "c" U0 ImageDrawTextEx(Image *dst, Font font,  U8 *text, Vector2 position, F32 fontSize, F32 spacing, Color tint); // Draw text (custom sprite font) within an image (destination)
extern "c" U0 ImageDrawTextPro(Image *dst, Font font,  U8 *text, Vector2 position, Vector2 origin, F32 rotation, F32 fontSize, F32 spacing, Color tint); // Draw text using Font and pro parameters (rotation)

// Texture loading functions
// NOTE: These functions require GPU access
extern "c" Texture LoadTexture( U8 *fileName);                                                       // Load texture from file into GPU memory (VRAM)
extern "c" Texture LoadTextureFromImage(Image image);                                                       // Load texture from image data
extern "c" Texture LoadTextureCubemap(Image image, I32 layout);                                        // Load cubemap from image, multiple image cubemap layouts supported
extern "c" RenderTexture LoadRenderTexture(I32 width, I32 height);                                          // Load texture for rendering (framebuffer)
extern "c" RenderTexture LoadRenderTextureEx(I32 width, I32 height, I32 format);                            // Load texture for rendering (framebuffer), with specific format
extern "c" Bool IsTextureValid(Texture texture);                                                            // Check if texture is valid (loaded in GPU)
extern "c" U0 UnloadTexture(Texture texture);                                                             // Unload texture from GPU memory (VRAM)
extern "c" Bool IsRenderTextureValid(RenderTexture target);                                                 // Check if render texture is valid (loaded in GPU)
extern "c" U0 UnloadRenderTexture(RenderTexture target);                                                  // Unload render texture from GPU memory (VRAM)
extern "c" U0 UpdateTexture(Texture texture,  U0 *pixels);                                         // Update GPU texture with new data (pixels should be able to fill texture)
extern "c" U0 UpdateTextureRec(Texture texture, Rectangle rec,  U0 *pixels);                       // Update GPU texture rectangle with new data (pixels and rec should fit in texture)

// Texture configuration functions
extern "c" U0 GenTextureMipmaps(Texture *texture);                                                        // Generate GPU mipmaps for a texture
extern "c" U0 SetTextureFilter(Texture texture, I32 filter);                                              // Set texture scaling filter mode
extern "c" U0 SetTextureWrap(Texture texture, I32 wrap);                                                  // Set texture wrapping mode

// Texture drawing functions
extern "c" U0 DrawTexture(Texture texture, I32 posX, I32 posY, Color tint);                               // Draw a Texture2D
extern "c" U0 DrawTextureV(Texture texture, Vector2 position, Color tint);                                // Draw a Texture2D with position defined as Vector2
extern "c" U0 DrawTextureEx(Texture texture, Vector2 position, F32 rotation, F32 scale, Color tint);  // Draw a Texture2D with rotation and scale
extern "c" U0 DrawTextureRec(Texture texture, Rectangle rec, Vector2 position, Color tint);               // Draw a part of a texture defined by a rectangle
extern "c" U0 DrawTexturePro(Texture texture, Rectangle srcrec, Rectangle dstrec, Vector2 origin, F32 rotation, Color tint); // Draw a part of a texture defined by a source rectangle to destination rectangle, with scaling and rotation
extern "c" U0 DrawTextureNPatch(Texture texture, NPatchInfo nPatchInfo, Rectangle dstrec, Vector2 origin, F32 rotation, Color tint); // Draw a texture (or part of it) that stretches or shrinks nicely

// Color/pixel related functions
extern "c" Bool ColorIsEqual(Color col1, Color col2);                            // Check if two colors are equal
extern "c" Color Fade(Color color, F32 alpha);                                 // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern "c" I32 ColorToInt(Color color);                                          // Get hexadecimal value for a Color (0xRRGGBBAA)
extern "c" Vector4 ColorNormalize(Color color);                                  // Get Color normalized as F32 [0..1]
extern "c" Color ColorFromNormalized(Vector4 normalized);                        // Get Color from normalized values [0..1]
extern "c" Vector3 ColorToHSV(Color color);                                      // Get HSV values for a Color, hue [0..360], saturation/value [0..1]
extern "c" Color ColorFromHSV(F32 hue, F32 saturation, F32 value);         // Get a Color from HSV values, hue [0..360], saturation/value [0..1]
extern "c" Color ColorTint(Color color, Color tint);                             // Get color multiplied with another color
extern "c" Color ColorBrightness(Color color, F32 factor);                     // Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
extern "c" Color ColorContrast(Color color, F32 contrast);                     // Get color with contrast correction, contrast values between -1.0f and 1.0f
extern "c" Color ColorAlpha(Color color, F32 alpha);                           // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern "c" Color ColorAlphaBlend(Color dst, Color src, Color tint);              // Get src alpha-blended into dst color with tint
extern "c" Color ColorLerp(Color color1, Color color2, F32 factor);            // Get color lerp interpolation between two colors, factor [0.0f..1.0f]
extern "c" Color GetColor(U32 hexValue);                                // Get Color structure from hexadecimal value
extern "c" Color GetPixelColor( U0 *srcPtr, I32 format);                  // Get Color from a source pixel pointer of certain format
extern "c" U0 SetPixelColor(U0 *dstPtr, Color color, I32 format);            // Set color formatted into destination pixel pointer
extern "c" I32 GetPixelDataSize(I32 width, I32 height, I32 format);              // Get pixel data size in bytes for certain format

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------

// Font loading/unloading functions
extern "c" Font GetFontDefault(U0);                                                            // Get the default Font
extern "c" Font LoadFont( U8 *fileName);                                                  // Load font from file into GPU memory (VRAM)
extern "c" Font LoadFontEx( U8 *fileName, I32 fontSize,  I32 *codepoints, I32 codepointCount); // Load font from file with defined codepoints and generation size, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
extern "c" Font LoadFontFromImage(Image image, Color key, I32 firstChar);                        // Load font from Image (XNA style)
extern "c" Font LoadFontFromMemory( U8 *fileType,  U8 *fileData, I32 dataSize, I32 fontSize,  I32 *codepoints, I32 codepointCount); // Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
extern "c" Bool IsFontValid(Font font);                                                          // Check if font is valid (font data loaded, WARNING: GPU texture not checked)
extern "c" GlyphInfo *LoadFontData( U8 *fileData, I32 dataSize, I32 fontSize,  I32 *codepoints, I32 codepointCount, I32 type, I32 *glyphCount); // Load font data for further use
extern "c" Image GenImageFontAtlas( GlyphInfo *glyphs, Rectangle **glyphRecs, I32 glyphCount, I32 fontSize, I32 padding, I32 packMethod); // Generate image font atlas using chars info
extern "c" U0 UnloadFontData(GlyphInfo *glyphs, I32 glyphCount);                               // Unload font chars info data (RAM)
extern "c" U0 UnloadFont(Font font);                                                           // Unload font from GPU memory (VRAM)
extern "c" Bool ExportFontAsCode(Font font,  U8 *fileName);                               // Export font as code file, returns true on success

// Text drawing functions
extern "c" U0 DrawFPS(I32 posX, I32 posY);                                                     // Draw current FPS
extern "c" U0 DrawText( U8 *text, I32 posX, I32 posY, I32 fontSize, Color color);       // Draw text (using default font)
extern "c" U0 DrawTextEx(Font font,  U8 *text, Vector2 position, F32 fontSize, F32 spacing, Color tint); // Draw text using font and additional parameters
extern "c" U0 DrawTextPro(Font font,  U8 *text, Vector2 position, Vector2 origin, F32 rotation, F32 fontSize, F32 spacing, Color tint); // Draw text using Font and pro parameters (rotation)
extern "c" U0 DrawTextCodepoint(Font font, I32 codepoint, Vector2 position, F32 fontSize, Color tint); // Draw one character (codepoint)
extern "c" U0 DrawTextCodepoints(Font font,  I32 *codepoints, I32 codepointCount, Vector2 position, F32 fontSize, F32 spacing, Color tint); // Draw multiple characters (codepoint)

// Text font info functions
extern "c" U0 SetTextLineSpacing(I32 spacing);                                                 // Set vertical line spacing when drawing with line-breaks
extern "c" I32 MeasureText( U8 *text, I32 fontSize);                                      // Measure string width for default font
extern "c" Vector2 MeasureTextEx(Font font,  U8 *text, F32 fontSize, F32 spacing);    // Measure string size for Font
extern "c" Vector2 MeasureTextCodepoints(Font font,  I32 *codepoints, I32 length, F32 fontSize, F32 spacing); // Measure string size for an existing array of codepoints for Font
extern "c" I32 GetGlyphIndex(Font font, I32 codepoint);                                          // Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
extern "c" GlyphInfo GetGlyphInfo(Font font, I32 codepoint);                                     // Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
extern "c" Rectangle GetGlyphAtlasRec(Font font, I32 codepoint);                                 // Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found

// Text codepoints management functions (unicode characters)
extern "c" U8 *LoadUTF8( I32 *codepoints, I32 length);                                    // Load UTF-8 text encoded from codepoints array
extern "c" U0 UnloadUTF8(U8 *text);                                                          // Unload UTF-8 text encoded from codepoints array
extern "c" I32 *LoadCodepoints( U8 *text, I32 *count);                                    // Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
extern "c" U0 UnloadCodepoints(I32 *codepoints);                                               // Unload codepoints data from memory
extern "c" I32 GetCodepointCount( U8 *text);                                              // Get total number of codepoints in a UTF-8 encoded string
extern "c" I32 GetCodepoint( U8 *text, I32 *codepointSize);                               // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern "c" I32 GetCodepointNext( U8 *text, I32 *codepointSize);                           // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern "c" I32 GetCodepointPrevious( U8 *text, I32 *codepointSize);                       // Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern "c"  U8 *CodepointToUTF8(I32 codepoint, I32 *utf8Size);                            // Encode one codepoint into UTF-8 byte array (array length returned as parameter)

// Text strings management functions (no UTF-8 strings, only byte chars)
// WARNING 1: Most of these functions use internal static buffers[], it's recommended to store returned data on user-side for re-use
// WARNING 2: Some functions allocate memory internally for the returned strings, those strings must be freed by user using MemFree()
extern "c" U8 **LoadTextLines( U8 *text, I32 *count);                                   // Load text as separate lines ('\n')
extern "c" U0 UnloadTextLines(U8 **text, I32 lineCount);                                     // Unload text lines
extern "c" I32 TextCopy(U8 *dst,  U8 *src);                                             // Copy one string to another, returns bytes copied
extern "c" Bool TextIsEqual( U8 *text1,  U8 *text2);                               // Check if two text strings are equal
extern "c" U32 TextLength( U8 *text);                                            // Get text length, checks for '\0' ending
extern "c"  U8 *TextFormat( U8 *text, ...);                                        // Text formatting with variables (sprintf() style)
extern "c"  U8 *TextSubtext( U8 *text, I32 position, I32 length);                  // Get a piece of a text string
extern "c"  U8 *TextRemoveSpaces( U8 *text);                                       // Remove text spaces, concat words
extern "c" U8 *GetTextBetween( U8 *text,  U8 *begin,  U8 *end);           // Get text between two strings
extern "c" U8 *TextReplace( U8 *text,  U8 *search,  U8 *replacement);     // Replace text string with new string
extern "c" U8 *TextReplaceAlloc( U8 *text,  U8 *search,  U8 *replacement); // Replace text string with new string, memory must be MemFree()
extern "c" U8 *TextReplaceBetween( U8 *text,  U8 *begin,  U8 *end,  U8 *replacement); // Replace text between two specific strings
extern "c" U8 *TextReplaceBetweenAlloc( U8 *text,  U8 *begin,  U8 *end,  U8 *replacement); // Replace text between two specific strings, memory must be MemFree()
extern "c" U8 *TextInsert( U8 *text,  U8 *insert, I32 position);                 // Insert text in a defined byte position
extern "c" U8 *TextInsertAlloc( U8 *text,  U8 *insert, I32 position);            // Insert text in a defined byte position, memory must be MemFree()
extern "c" U8 *TextJoin(U8 **textList, I32 count,  U8 *delimiter);                    // Join text strings with delimiter
extern "c" U8 **TextSplit( U8 *text, U8 delimiter, I32 *count);                       // Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings
extern "c" U0 TextAppend(U8 *text,  U8 *append, I32 *position);                       // Append text at specific position and move cursor
extern "c" I32 TextFindIndex( U8 *text,  U8 *search);                              // Find first text occurrence within a string, -1 if not found
extern "c" U8 *TextToUpper( U8 *text);                                                  // Get upper case version of provided string
extern "c" U8 *TextToLower( U8 *text);                                                  // Get lower case version of provided string
extern "c" U8 *TextToPascal( U8 *text);                                                 // Get Pascal case notation version of provided string
extern "c" U8 *TextToSnake( U8 *text);                                                  // Get Snake case notation version of provided string
extern "c" U8 *TextToCamel( U8 *text);                                                  // Get Camel case notation version of provided string
extern "c" I32 TextToInteger( U8 *text);                                                  // Get integer value from text
extern "c" F32 TextToFloat( U8 *text);                                                  // Get F32 value from text

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Basic geometric 3D shapes drawing functions
extern "c" U0 DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);                                    // Draw a line in 3D world space
extern "c" U0 DrawPoint3D(Vector3 position, Color color);                                                   // Draw a point in 3D space, actually a small line
extern "c" U0 DrawCircle3D(Vector3 center, F32 radius, Vector3 rotationAxis, F32 rotationAngle, Color color); // Draw a circle in 3D world space
extern "c" U0 DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);                              // Draw a color-filled triangle, counter-clockwise vertex order
extern "c" U0 DrawTriangleStrip3D( Vector3 *points, I32 pointCount, Color color);                      // Draw a triangle strip defined by points
extern "c" U0 DrawCube(Vector3 position, F32 width, F32 height, F32 length, Color color);             // Draw cube
extern "c" U0 DrawCubeV(Vector3 position, Vector3 size, Color color);                                       // Draw cube (Vector version)
extern "c" U0 DrawCubeWires(Vector3 position, F32 width, F32 height, F32 length, Color color);        // Draw cube wires
extern "c" U0 DrawCubeWiresV(Vector3 position, Vector3 size, Color color);                                  // Draw cube wires (Vector version)
extern "c" U0 DrawSphere(Vector3 centerPos, F32 radius, Color color);                                     // Draw sphere
extern "c" U0 DrawSphereEx(Vector3 centerPos, F32 radius, I32 rings, I32 slices, Color color);            // Draw sphere with defined rings and slices
extern "c" U0 DrawSphereWires(Vector3 centerPos, F32 radius, I32 rings, I32 slices, Color color);         // Draw sphere wires
extern "c" U0 DrawCylinder(Vector3 position, F32 radiusTop, F32 radiusBottom, F32 height, I32 sides, Color color); // Draw a cylinder/cone
extern "c" U0 DrawCylinderEx(Vector3 startPos, Vector3 endPos, F32 startRadius, F32 endRadius, I32 sides, Color color); // Draw a cylinder with base at startPos and top at endPos
extern "c" U0 DrawCylinderWires(Vector3 position, F32 radiusTop, F32 radiusBottom, F32 height, I32 sides, Color color); // Draw a cylinder/cone wires
extern "c" U0 DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, F32 startRadius, F32 endRadius, I32 sides, Color color); // Draw a cylinder wires with base at startPos and top at endPos
extern "c" U0 DrawCapsule(Vector3 startPos, Vector3 endPos, F32 radius, I32 rings, I32 slices, Color color); // Draw a capsule with the center of its sphere caps at startPos and endPos
extern "c" U0 DrawCapsuleWires(Vector3 startPos, Vector3 endPos, F32 radius, I32 rings, I32 slices, Color color); // Draw capsule wireframe with the center of its sphere caps at startPos and endPos
extern "c" U0 DrawPlane(Vector3 centerPos, Vector2 size, Color color);                                      // Draw a plane XZ
extern "c" U0 DrawRay(Ray ray, Color color);                                                                // Draw a ray line
extern "c" U0 DrawGrid(I32 slices, F32 spacing);                                                          // Draw a grid (centered at (0, 0, 0))

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Model management functions
extern "c" Model LoadModel( U8 *fileName);                                                // Load model from files (meshes and materials)
extern "c" Model LoadModelFromMesh(Mesh mesh);                                                   // Load model from generated mesh (default material)
extern "c" Bool IsModelValid(Model model);                                                       // Check if model is valid (loaded in GPU, VAO/VBOs)
extern "c" U0 UnloadModel(Model model);                                                        // Unload model (including meshes) from memory (RAM and/or VRAM)
extern "c" BoundingBox GetModelBoundingBox(Model model);                                         // Compute model bounding box limits (considers all meshes)

// Model drawing functions
extern "c" U0 DrawModel(Model model, Vector3 position, F32 scale, Color tint);               // Draw a model (with texture if set)
extern "c" U0 DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, F32 rotationAngle, Vector3 scale, Color tint); // Draw a model with custom transform
extern "c" U0 DrawModelWires(Model model, Vector3 position, F32 scale, Color tint);          // Draw a model wires (with texture if set)
extern "c" U0 DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, F32 rotationAngle, Vector3 scale, Color tint); // Draw a model wires with custom transform
extern "c" U0 DrawBoundingBox(BoundingBox box, Color color);                                   // Draw bounding box (wires)
extern "c" U0 DrawBillboard(Camera3D camera, Texture texture, Vector3 position, F32 scale, Color tint); // Draw a billboard texture
extern "c" U0 DrawBillboardRec(Camera3D camera, Texture texture, Rectangle rec, Vector3 position, Vector2 size, Color tint); // Draw a billboard texture defined by rectangle
extern "c" U0 DrawBillboardPro(Camera3D camera, Texture texture, Rectangle rec, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, F32 rotation, Color tint); // Draw a billboard texture defined by source rectangle with scaling and rotation

// Mesh management functions
extern "c" U0 UploadMesh(Mesh *mesh, Bool dynamic);                                            // Upload mesh vertex data in GPU and provide VAO/VBO ids
extern "c" U0 UpdateMeshBuffer(Mesh mesh, I32 index,  U0 *data, I32 dataSize, I32 offset); // Update mesh vertex data in GPU for a specific buffer index
extern "c" U0 UnloadMesh(Mesh mesh);                                                           // Unload mesh data from CPU and GPU
extern "c" U0 DrawMesh(Mesh mesh, Material material, Matrix transform);                        // Draw a 3d mesh with material and transform
extern "c" U0 DrawMeshInstanced(Mesh mesh, Material material,  Matrix *transforms, I32 instances); // Draw multiple mesh instances with material and different transforms
extern "c" BoundingBox GetMeshBoundingBox(Mesh mesh);                                            // Compute mesh bounding box limits
extern "c" U0 GenMeshTangents(Mesh *mesh);                                                     // Compute mesh tangents
extern "c" Bool ExportMesh(Mesh mesh,  U8 *fileName);                                     // Export mesh data to file, returns true on success
extern "c" Bool ExportMeshAsCode(Mesh mesh,  U8 *fileName);                               // Export mesh as code file (.h) defining multiple arrays of vertex attributes

// Mesh generation functions
extern "c" Mesh GenMeshPoly(I32 sides, F32 radius);                                            // Generate polygonal mesh
extern "c" Mesh GenMeshPlane(F32 width, F32 length, I32 resX, I32 resZ);                     // Generate plane mesh (with subdivisions)
extern "c" Mesh GenMeshCube(F32 width, F32 height, F32 length);                            // Generate cuboid mesh
extern "c" Mesh GenMeshSphere(F32 radius, I32 rings, I32 slices);                              // Generate sphere mesh (standard sphere)
extern "c" Mesh GenMeshHemiSphere(F32 radius, I32 rings, I32 slices);                          // Generate half-sphere mesh (no bottom cap)
extern "c" Mesh GenMeshCylinder(F32 radius, F32 height, I32 slices);                         // Generate cylinder mesh
extern "c" Mesh GenMeshCone(F32 radius, F32 height, I32 slices);                             // Generate cone/pyramid mesh
extern "c" Mesh GenMeshTorus(F32 radius, F32 size, I32 radSeg, I32 sides);                   // Generate torus mesh
extern "c" Mesh GenMeshKnot(F32 radius, F32 size, I32 radSeg, I32 sides);                    // Generate trefoil knot mesh
extern "c" Mesh GenMeshHeightmap(Image heightmap, Vector3 size);                                 // Generate heightmap mesh from image data
extern "c" Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);                               // Generate cubes-based map mesh from image data

// Material loading/unloading functions
extern "c" Material *LoadMaterials( U8 *fileName, I32 *materialCount);                    // Load materials from model file
extern "c" Material LoadMaterialDefault(U0);                                                   // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
extern "c" Bool IsMaterialValid(Material material);                                              // Check if material is valid (shader assigned, map textures loaded in GPU)
extern "c" U0 UnloadMaterial(Material material);                                               // Unload material from GPU memory (VRAM)
extern "c" U0 SetMaterialTexture(Material *material, I32 mapType, Texture texture);          // Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
extern "c" U0 SetModelMeshMaterial(Model *model, I32 meshId, I32 materialId);                  // Set material for a mesh

// Model animations loading/unloading functions
extern "c" ModelAnimation *LoadModelAnimations( U8 *fileName, I32 *animCount);            // Load model animations from file
extern "c" U0 UpdateModelAnimation(Model model, ModelAnimation anim, F32 frame);             // Update model animation pose (vertex buffers and bone matrices)
extern "c" U0 UpdateModelAnimationEx(Model model, ModelAnimation animA, F32 frameA, ModelAnimation animB, F32 frameB, F32 blend); // Update model animation pose, blending two animations
extern "c" U0 UnloadModelAnimations(ModelAnimation *animations, I32 animCount);                // Unload animation array data
extern "c" Bool IsModelAnimationValid(Model model, ModelAnimation anim);                         // Check model animation skeleton match

// Collision detection functions
extern "c" Bool CheckCollisionSpheres(Vector3 center1, F32 radius1, Vector3 center2, F32 radius2); // Check collision between two spheres
extern "c" Bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);                         // Check collision between two bounding boxes
extern "c" Bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, F32 radius);          // Check collision between box and sphere
extern "c" RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, F32 radius);            // Get collision info between ray and sphere
extern "c" RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);                            // Get collision info between ray and box
extern "c" RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);               // Get collision info between ray and mesh
extern "c" RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);    // Get collision info between ray and triangle
extern "c" RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4); // Get collision info between ray and quad

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
//U0 *AudioCallback(U0 *bufferData, U32 frames);

// Audio device management functions
extern "c" U0 InitAudioDevice(U0);                                     // Initialize audio device and context
extern "c" U0 CloseAudioDevice(U0);                                    // Close the audio device and context
extern "c" Bool IsAudioDeviceReady(U0);                                  // Check if audio device has been initialized successfully
extern "c" U0 SetMasterVolume(F32 volume);                             // Set master volume (listener)
extern "c" F32 GetMasterVolume(U0);                                    // Get master volume (listener)

// Wave/Sound loading/unloading functions
extern "c" Wave LoadWave( U8 *fileName);                            // Load wave data from file
extern "c" Wave LoadWaveFromMemory( U8 *fileType,  U8 *fileData, I32 dataSize); // Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
extern "c" Bool IsWaveValid(Wave wave);                                    // Check if wave data is valid (data loaded and parameters)
extern "c" Sound LoadSound( U8 *fileName);                          // Load sound from file
extern "c" Sound LoadSoundFromWave(Wave wave);                             // Load sound from wave data
extern "c" Sound LoadSoundAlias(Sound source);                             // Load sound alias, new sound that shares the same sample data as the source sound, does not own the sound data
extern "c" Bool IsSoundValid(Sound sound);                                 // Check if sound is valid (data loaded and buffers initialized)
extern "c" U0 UpdateSound(Sound sound,  U0 *data, I32 frameCount); // Update sound buffer with new data (default data format: 32 bit F32, stereo)
extern "c" U0 UnloadWave(Wave wave);                                     // Unload wave data
extern "c" U0 UnloadSound(Sound sound);                                  // Unload sound
extern "c" U0 UnloadSoundAlias(Sound alias);                             // Unload sound alias (does not deallocate sample data)
extern "c" Bool ExportWave(Wave wave,  U8 *fileName);               // Export wave data to file, returns true on success
extern "c" Bool ExportWaveAsCode(Wave wave,  U8 *fileName);         // Export wave sample data to code (.h), returns true on success

// Wave/Sound management functions
extern "c" U0 PlaySound(Sound sound);                                    // Play a sound
extern "c" U0 StopSound(Sound sound);                                    // Stop playing a sound
extern "c" U0 PauseSound(Sound sound);                                   // Pause a sound
extern "c" U0 ResumeSound(Sound sound);                                  // Resume a paused sound
extern "c" Bool IsSoundPlaying(Sound sound);                               // Check if sound is currently playing
extern "c" U0 SetSoundVolume(Sound sound, F32 volume);                 // Set volume for a sound (1.0 is max level)
extern "c" U0 SetSoundPitch(Sound sound, F32 pitch);                   // Set pitch for a sound (1.0 is base level)
extern "c" U0 SetSoundPan(Sound sound, F32 pan);                       // Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
extern "c" Wave WaveCopy(Wave wave);                                       // Copy a wave to a new wave
extern "c" U0 WaveCrop(Wave *wave, I32 initFrame, I32 finalFrame);       // Crop a wave to defined frames range
extern "c" U0 WaveFormat(Wave *wave, I32 sampleRate, I32 sampleSize, I32 channels); // Convert wave data to desired format
extern "c" F32 *LoadWaveSamples(Wave wave);                              // Load samples data from wave as a 32bit F32 data array
extern "c" U0 UnloadWaveSamples(F32 *samples);                         // Unload samples data loaded with LoadWaveSamples()

// Music management functions
extern "c" Music LoadMusicStream( U8 *fileName);                    // Load music stream from file
extern "c" Music LoadMusicStreamFromMemory( U8 *fileType,  U8 *data, I32 dataSize); // Load music stream from data
extern "c" Bool IsMusicValid(Music music);                                 // Check if music stream is valid (context and buffers initialized)
extern "c" U0 UnloadMusicStream(Music music);                            // Unload music stream
extern "c" U0 PlayMusicStream(Music music);                              // Start music playing
extern "c" Bool IsMusicStreamPlaying(Music music);                         // Check if music is playing
extern "c" U0 UpdateMusicStream(Music music);                            // Update buffers for music streaming
extern "c" U0 StopMusicStream(Music music);                              // Stop music playing
extern "c" U0 PauseMusicStream(Music music);                             // Pause music playing
extern "c" U0 ResumeMusicStream(Music music);                            // Resume playing paused music
extern "c" U0 SeekMusicStream(Music music, F32 position);              // Seek music to a position (in seconds)
extern "c" U0 SetMusicVolume(Music music, F32 volume);                 // Set volume for music (1.0 is max level)
extern "c" U0 SetMusicPitch(Music music, F32 pitch);                   // Set pitch for music (1.0 is base level)
extern "c" U0 SetMusicPan(Music music, F32 pan);                       // Set pan for music (-1.0 left, 0.0 center, 1.0 right)
extern "c" F32 GetMusicTimeLength(Music music);                          // Get music time length (in seconds)
extern "c" F32 GetMusicTimePlayed(Music music);                          // Get current music time played (in seconds)

// AudioStream management functions
extern "c" AudioStream LoadAudioStream(U32 sampleRate, U32 sampleSize, U32 channels); // Load audio stream (to stream raw audio pcm data)
extern "c" Bool IsAudioStreamValid(AudioStream stream);                    // Check if an audio stream is valid (buffers initialized)
extern "c" U0 UnloadAudioStream(AudioStream stream);                     // Unload audio stream and free memory
extern "c" U0 UpdateAudioStream(AudioStream stream,  U0 *data, I32 frameCount); // Update audio stream buffers with data
extern "c" Bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
extern "c" U0 PlayAudioStream(AudioStream stream);                       // Play audio stream
extern "c" U0 PauseAudioStream(AudioStream stream);                      // Pause audio stream
extern "c" U0 ResumeAudioStream(AudioStream stream);                     // Resume audio stream
extern "c" Bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
extern "c" U0 StopAudioStream(AudioStream stream);                       // Stop audio stream
extern "c" U0 SetAudioStreamVolume(AudioStream stream, F32 volume);    // Set volume for audio stream (1.0 is max level)
extern "c" U0 SetAudioStreamPitch(AudioStream stream, F32 pitch);      // Set pitch for audio stream (1.0 is base level)
extern "c" U0 SetAudioStreamPan(AudioStream stream, F32 pan);          // Set pan for audio stream (-1.0 left, 0.0 center, 1.0 right)
extern "c" U0 SetAudioStreamBufferSizeDefault(I32 size);                 // Default size for new audio streams
/*  ??FIND?? these are disabled because i dont know how to make audiocallback work
extern "c" U0 SetAudioStreamCallback(AudioStream stream, AudioCallback callback); // Audio thread callback to request new data

extern "c" U0 AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Attach audio stream processor to stream, receives frames x 2 samples as 'F32' (stereo)
extern "c" U0 DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Detach audio stream processor from stream

extern "c" U0 AttachAudioMixedProcessor(AudioCallback processor); // Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'F32' (stereo)
extern "c" U0 DetachAudioMixedProcessor(AudioCallback processor); // Detach audio stream processor from the entire audio pipeline
*/

