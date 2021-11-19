//
//  Home.swift
//  SwiftUI_CustomSegmentedPicker
//
//  Created by park kyung seok on 2021/11/18.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "Incomings"
    // slideアニメーションをするため
    @Namespace var animation
    
    @State var weeks: [Week] = []
    
    // Current Week Day
    @State var currentWeek: Week = Week(day: "", date: "", amountSpent: 0.0)
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: { }) {
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: { }) {
                    Image("dashboard")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            //Top Title
            Text("Statistics")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            // Custom Segment Picker..
            HStack {
                
                Text("Incomings")
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 25)
                    .background(
                        
                        ZStack {
                            if currentTab == "Incomings" {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "SegTab", in: animation)
                            }
                        }
                    )
                    .foregroundColor(currentTab == "Incomings" ? .black : .white)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            currentTab = "Incomings"
                        }
                    }
                
                Text("Outgoings")
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 25)
                    .background(
                        
                        ZStack {
                            if currentTab == "Outgoings" {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "SegTab", in: animation)
                            }
                        }
                    )
                    .foregroundColor(currentTab == "Outgoings" ? .black : .white)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                            currentTab = "Outgoings"
                        }
                    }

            }
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.35))
            .cornerRadius(10)
            .padding(.top)
            
            
            // Circle Money View..
            HStack( spacing: 37) {
                
                // (Circle)
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 22)
                    
                    let strokeStyle = StrokeStyle(lineWidth: 22, lineCap: .round, lineJoin: .round)
                    
                    let progress = CGFloat(currentWeek.amountSpent / 500)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.yellow, style: strokeStyle)
                        .rotationEffect(.init(degrees: -90))
                    
                    Image(systemName: "dollarsign.square.fill")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: 180)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Spent")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                    
                    Text("$\(Int(currentWeek.amountSpent))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Maximum")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                        .padding(.top, 10)
                    
                    Text("$500")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            }
            .padding()
            .padding(.leading)
            
            VStack {
                                
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 100, height: 2)
                    .padding()
                
                
                HStack(spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Your Balance")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("May 1 2021")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: { }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .offset(x: -10)
                    }
                }
                .padding(.horizontal)
                
                // $22,306.07..
                HStack {
                    
                    Text("$22,306.07")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "arrow.up")
                        .foregroundColor(.gray)
                    
                    Text("14%")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 8)
                .padding(.horizontal, 12)
                
                // Weeks..
                HStack(spacing: 0) {
                    ForEach(weeks) { week in
                        
                        VStack(spacing: 10) {
                            Text(week.day)
                                .fontWeight(.bold)
                                .foregroundColor(currentWeek == week ? Color.white : Color.black)
                            
                            Text(week.date)
                                .fontWeight(.bold)
                                .foregroundColor(currentWeek == week ? Color.white : Color.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(currentWeek == week ? Color.yellow : Color.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation() {
                                currentWeek = week

                            }
                        }
                    }
                }
                .padding(.horizontal, 14)
                
                // arrows..
                Button(action: { }) {
                    Image("arrow")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 50)
                        .background(Color("bg"))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                        .padding(.top)
                }
             
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Color.white
                    .clipShape(CustomShape(corners: [.topLeft, .topRight], radius: 30))
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            
            Spacer(minLength: 0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea())
        .onAppear {
            
            getWeekDays()
        }
    }
    
    // getting Current Week 7 Days...
    func getWeekDays() {
        
        let calender = Calendar.current
        
        let week = calender.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let startDate = week?.start else { return  }
        print(startDate)
        
        for index in 0..<7 {
            guard let date = calender.date(byAdding: .day, value: index, to: startDate) else { return }

            let formatter = DateFormatter()
            
            // EEE will be used to get day like Mon, Tue..
            formatter.dateFormat = "EEE"
            
            var day = formatter.string(from: date)
    
            // Since we need like Mo Tu
            day.removeLast()
            
            formatter.dateFormat = "dd"

            let  dateString = formatter.string(from: date)
            
            // RandomAmount for representing circleView
            let amountSpent: Double = index == 0 ? 30 : Double(index) * 60
            self.weeks.append(Week(day: day, date: dateString, amountSpent: amountSpent))
        }
        
        self.currentWeek = weeks.first!
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
