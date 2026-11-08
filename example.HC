#include "./rcore.HC"

U0 Main( ) {
	I32 ScreenHeight = 600; 
	I32 ScreenWidth = 600;
	InitWindow( ScreenWidth, ScreenHeight, "Gods Chosen Library" );
	SetTargetFPS(30);
	Vector2 balls[10];
	while ( !WindowShouldClose() ) {
		BeginDrawing();
		ClearBackground( RAYWHITE );
		EndDrawing();
	} 
	CloseWindow();
}


