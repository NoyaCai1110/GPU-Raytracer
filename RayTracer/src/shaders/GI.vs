#version 330 core
layout (location = 0) in vec3 aPos;

layout (location = 1) in vec3 aColor;

out vec3 ourColor;
out vec2 screenCoord;
//out vec2 TexCoord;
uniform mat4 model;     //局部-->世界
uniform mat4 view;      //世界-->相机观察的空间
uniform mat4 projection;  //对观察空间做透视除法
uniform mat4 mvp;


void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0f); //先model，然后view，最后proj
    //gl_Position = vec4(aPos, 1.0f);
    ourColor = aColor;
    screenCoord = (vec2(aPos.x, aPos.y) + 1.0) / 2.0;
}