package com.uni.spring.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.spring.reservation.model.service.ReservationService;

@SessionAttributes("loginUser")
@Controller
public class ReservationController {
	
	@Autowired
	public ReservationService reservationService;
	
	@RequestMapping(value="roomReservation.do")
	public String selectReservation() {
		
		return "reservation/reservationMain";
	}
	
	
}
