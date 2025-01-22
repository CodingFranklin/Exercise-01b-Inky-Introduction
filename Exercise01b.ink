/*
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> Cave_Mouth

== Cave_Mouth ==
You are at the entrance to a cave. {not Torch_Pickup: |There is a torch on the floor.} The cave extends to east and west. {Sword_Pickup: You have your {Sword_Sharpened: sharpened| dull} sword in your right hand.|}
* {not Torch_Pickup} [Take the torch] -> Torch_Pickup
+ {not Torch_Pickup} [Take the east tunnel] -> East_Tunnel
+ {not Torch_Pickup} [Take the west tunnel] -> West_Tunnel
+ {Torch_Pickup} [Take the Eest tunnel] -> East_Tunnel_lit
+ {Torch_Pickup && not Sword_Sharpened} [Take the west tunnel] -> West_Tunnel_lit
* [Exit cave] -> END



== East_Tunnel ==
You are in the east tunnel. It is too dark. You need some light.
* {Torch_Pickup} [Light torch] -> East_Tunnel_lit
+ [Go back] -> Cave_Mouth
-> END

== West_Tunnel ==
You are in the west tunnel. It is too dark. You need some light.
* {Torch_Pickup && not East_Tunnel_lit} [Light torch] -> West_Tunnel_lit
+ [Go back] -> Cave_Mouth
-> END

=== Torch_Pickup === 
You now have a torch. May it light the way.
* [Go back] -> Cave_Mouth

=== East_Tunnel_lit ===
The light of your torch glints off of the thousands of coins in the room. But a huge sleeping bear lay in front of the coins. To get the treasure, you need a weapon to fight with the bear.
* {Sword_Sharpened} [Attack with the bear with the sword!] -> Win
+ [Go back] -> Cave_Mouth
-> END

== West_Tunnel_lit ==
{not Sword_Pickup: With the light, you find that in the middle of the cave stood an ancient sword. | It is empty here. }
* {not Sword_Pickup} [Try to pull the sword out] -> Pull_Sword_With_One_Hand
* {Sword_Pickup && not Sword_Sharpened} [Try sharpening your sword with the stone walls of a cave] -> Sword_Sharpened
+ [Go back] -> Cave_Mouth
-> END



== Pull_Sword_With_One_Hand ==
You have failed. It seems like one hand isn't strong enough to pull this sword out.
* [Put the torch down and try with both of your hands] -> Sword_Pickup

=== Sword_Pickup ===
After a few attempts with both of your hands, you sccessfully pull out the sword! You look at the sword. It's covered with dust. After carefully wiping, you find that the blade of the sword is very dull.
* [Try sharpening your sword with the stone walls of a cave] -> Sword_Sharpened
* [Go back] -> Cave_Mouth

=== Sword_Sharpened ===
You made it. Now your blade gleams with deadly light.
* [Go back] -> Cave_Mouth

== Win ==
It was hard, but you finally beat the giant bear! You've got all the treasure!
-> END
