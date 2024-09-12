v Ghost Leg Game
v 2024.09.11

<                   v
v "Your result is " <           // Display result message
> : v                           // Get user input (1, 2 or 3)
^ , _ & v                                      
v       <

> 1-: v                         // Move to the start of the corresponding ladder
    v _ v                                     
 v      <                                     
 v  >       1-: v               // Move down the ladder
 v            v _ v                           
 v            >      v                        
 v         v      <  v                        
1v        2v        3v          // Ladder entry points
>v        v<        v<
v>#>#<>#<#<v        v<          // Ladder paths (move horizontally/vertically)
>v        v>#>#<>#<#<v
v>#>#<>#<#<v        v<
>v        v>#>#<>#<#<v
v>#>#<>#<#<v        v<
>v        v>#>#<>#<#<v
v>#>#<>#<#<v        v<
v<        v>#>#<>#<#<v
> "A", @  > "B", @   > "C", @   // Output the result (A, B or C)
