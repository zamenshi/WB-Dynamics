function Rocket = ComputeDragForceVec(Global,Rocket)
Rocket.RelWindVelVec = Global.WindVelVec - Rocket.ACVelVec;
Rocket.MachNum = norm(Rocket.RelWindVelVec)/Global.SoundSpeed;
Rocket.DragCoeff = interp1(...
 Rocket.MachNumData,Rocket.DragCoeffData,Rocket.MachNum,'spline');
Rocket.DragForceVec =...
 0.5*Rocket.DragCoeff*Global.AirDensity*Rocket.DragArea...
 *norm(Rocket.RelWindVelVec)*Rocket.RelWindVelVec;