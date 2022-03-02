//
//  GearsAndBeltsView.swift
//  SwiftUIAnimationTutorials
//
//  Created by Hamit Seyrek on 2.03.2022.
//

import SwiftUI

struct GearsAndBeltsView: View {
    var body: some View {
        ZStack {
            ZStack {
                Image("motor").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 120)
                    .offset(x: -110, y: 90)
                
                //MARK: - motor gear 1
                GearView(gearImage: "doubleGear", gearWidth: 40, gearDegrees: 360, offsetGearX: -114, offsetGearY: 102, duration: 5)
                
                ///top left gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -114, offsetGearY: -280, duration: 7)
            }
            
            //MARK: - top belt and gear3 and x axis rotation
            ZStack {
                ///top belt
                BeltView(animateBelt: true, beltWidth: 332, beltHeight: 100, offsetBeltX: 0, offsetBeltY: -280, dashPhaseValue: -360, rotateDegrees: 0)
                ///top right gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 114, offsetGearY: -280, duration: 7)
            }
            
            //MARK: - gear 4-5-6 and z axis rotation
            ZStack {
                /// middle right gear 4
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 114, offsetGearY: -70, duration: 5)
                
                /// middle second gear from the right gear 5
                GearView(gearImage: "doubleGear", gearWidth: 80, gearDegrees: -360, offsetGearX: 39, offsetGearY: -113, duration: 5)
                
                /// middle third gear from the right gear 6
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -18, offsetGearY: -83, duration: 6)
            }
            
            //MARK: - belt z axis rotation
            ZStack {
                ///belt 1 for the motor - long belt left side
                BeltView(animateBelt: true, beltWidth: 425, beltHeight: 48, offsetBeltX: -114, offsetBeltY: -90, rotateDegrees: 90)
                ///belt 2 - short belt right side
                BeltView(animateBelt: true, beltWidth: 258, beltHeight: 48, offsetBeltX: 114, offsetBeltY: -175, rotateDegrees: 90)
            }
            
            //MARK: - belt 3 gear 7  x axis rotation
            ZStack {
                ///middle fourth from the right gear 7
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: -72, offsetGearY: -85, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
                
                ///middle small belt
                BeltView(animateBelt: true, beltWidth: 22, beltHeight: 120, dashPhaseValue: -40)
                    .rotation3DEffect(.degrees(70), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -70, y: -40)
                
                ///bottom right gear 7
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: 152, offsetGearY: 94, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
                
                ///bottom right small belt
                BeltView(animateBelt: true, beltWidth: 22, beltHeight: 170, offsetBeltX: 0, offsetBeltY: -10, dashPhaseValue: -40, rotateDegrees: 0)
                    .rotation3DEffect(.degrees(70), axis: (x: 0, y: 1, z: 0))
                    .offset(x: 152, y: 170)
                
                ///bottom shaft
                ShaftView(width: 170).offset(x: 85, y: 245)
            }
            
            //MARK: - WORM GEAR AND Y AXIS ROTATION AND SHAFT VIEW
            ZStack {
                //worm gear
                WormGearsView().offset(x: 50, y: 20)
                
                //middle y axis gear
                GearView(gearImage: "singleGear", gearWidth: 175, gearDegrees: 360, offsetGearX: 50, offsetGearY: 30, rotateDegrees: 84, duration: 7, xAxis: 1, yAxis: 0, zAxis: 0)
                
                //shaftView connecting to the worm and belt
                ShaftView(width: 120).offset(x: -23, y: 20)
            }
            
            //MARK: - FAN
            FanView().offset(x: 10, y: 235).frame(width: 140, height: 140)
        }
        .background(Image("goldBackground").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 1000))
    }
}


struct GearsAndBeltsView_Previews: PreviewProvider {
    static var previews: some View {
        GearsAndBeltsView()
    }
}
