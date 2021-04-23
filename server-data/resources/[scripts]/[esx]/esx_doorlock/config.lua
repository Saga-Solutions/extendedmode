Config = {}
Config.Locale = 'en'

Config.DoorList = {

	-- Ana Giriş Sağ

	{
		textCoords = vector3(441.92, -998.81, 31.5),
		authorizedJobs = { 'police', 'sheriff' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 180.0,
				objCoords = vector3(442.56, -999.26, 30.72)
			},

			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 0.0,
				objCoords = vector3(441.24, -999.26, 30.72)
			}
		}
	},
	
	-- Ana Giriş Sol
	{
		textCoords = vector3(457.04, -972.23, 31.5),
		authorizedJobs = { 'police', 'sheriff' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 0.0,
				objCoords = vector3(456.49, -971.71, 30.71)
			},

			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = -180.0,
				objCoords = vector3(457.77, -971.74, 30.71)
			}
		}
	},
	 
	--Looby Sağ Kapı 
	{
		objName = 'gabz_mrpd_door_05',
		objYaw = 180.0,
		objCoords  = vector3(441.29, -985.71, 31.5),
		textCoords = vector3(441.14, -986.05, 31.5),
		authorizedJobs = { 'police', 'sheriff' },
		locked = true
	},
	
	--Looby Sağ Kapı
	{
		objName = 'gabz_mrpd_door_04',
		objYaw = 0.0,
		objCoords  = vector3(440.95, -978.12, 30.69),
		textCoords = vector3(441.05, -977.68, 31.5),
		authorizedJobs = { 'police', 'sheriff' },
		locked = true
	},
	

	
	

	


	
----- FIB -----

	{
		objName = 'v_ilev_fibl_door02',
		objCoords  = vector3(106.22, -744.02 ,45.75),
		textCoords = vector3(106.22, -744.02 ,45.75),
		authorizedJobs = { 'fbi' },
		locked = true,
		distance = 2.5,
		size = 2
	},
	
	{
		objName = 'v_ilev_fibl_door01',
		objCoords  = vector3(105.76, -745.45, 45.75), -- 106.22, -744.02 ,45.75
		textCoords = vector3(105.76, -745.45, 45.75),
		authorizedJobs = { 'fbi' },
		locked = true,
		distance = 2.5,
		size = 2
	},


----- MAVİ BAR (Tequila) -----

	{
		objName = 'v_ilev_roc_door4',
		objCoords  = vector3(-565.1712, 276.6259, 83.28626),
		textCoords = vector3(-565.1712, 276.6259, 83.28626),
		authorizedJobs = { 'nightclub' },
		locked = true,
		distance = 2.5,
		size = 2
	},
	
	{
		objName = 'v_ilev_roc_door2', 
		objCoords  = vector3(-560.2373, 293.0106 ,82.32609), 
		textCoords = vector3(-560.2373, 293.0106 ,82.32609),
		authorizedJobs = { 'nightclub' },
		locked = true,
		distance = 2.5,
		size = 2
	},
	
	{
		objName = 'v_ilev_roc_door4',
		objCoords  = vector3(-561.2866, 293.5044, 87.77851), 
		textCoords = vector3(-561.2866, 293.5044, 87.77851),
		authorizedJobs = { 'nightclub' },
		locked = true,
		distance = 2.5,
		size = 2
	},

-----HASTANE KAPILARI-----

	{
		textCoords = vector3(313.09, -572.18, 44.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_pillbox_doubledoor_l',
				objYaw = -20.0,
				objCoords  = vector3(312.15, -571.91, 43.28),
			},

			{
				objName = 'gabz_pillbox_doubledoor_r',
				objYaw = -20.0,
				objCoords  = vector3(313.75, -572.54, 43.28)
			}
		}
	},
	
	{
		textCoords = vector3(318.89, -574.31, 44.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_pillbox_doubledoor_l',
				objYaw = -20.0,
				objCoords  = vector3(318.14, -574.07, 43.28),
			},

			{
				objName = 'gabz_pillbox_doubledoor_r',
				objYaw = -20.0,
				objCoords  = vector3(319.83, -574.71, 43.28)
			}
		}
	},
	
	{
		textCoords = vector3(324.31, -576.29, 44.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_pillbox_doubledoor_l',
				objYaw = -20.0,
				objCoords  = vector3(323.41, -576.01, 43.28),
			},

			{
				objName = 'gabz_pillbox_doubledoor_r',
				objYaw = -20.0,
				objCoords  = vector3(325.24, -576.71, 43.28)
			}
		}
	},
	

	-- Delperro PD
--[[	{
		textCoords = vector3(-1632.32, -1015.69, 13.13),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_csr_door_l',  --Sol
				objYaw = -219.0,
				objCoords  = vector3(-1631.79, -1015.87, 13.13),
			},

			{
				objName = 'v_ilev_csr_door_r', --Sag
				objYaw = 140.0,
				objCoords  = vector3(-1632.67, -1015.11, 13.12)
			}
		}
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 230.0,
		objCoords  = vector3(-1625.23, -1031.19, 13.15),
		textCoords = vector3(-1625.51, -1032.01, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 230.0,
		objCoords  = vector3(-1623.25, -1028.61, 13.15),
		textCoords = vector3(-1623.18, -1029.30, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 140.0,
		objCoords  = vector3(-1628.20, -1023.16, 13.15),
		textCoords = vector3(-1628.83, -1023.20, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 140.0,
		objCoords  = vector3(-1622.07, -1019.64, 13.15),
		textCoords = vector3(-1622.09, -1018.93, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 140.0,
		objCoords  = vector3(-1632.98, -1028.22, 13.19),
		textCoords = vector3(-1633.52, -1028.26, 13.19),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 230.0,
		objCoords  = vector3(-1613.64, -1026.95, 13.15),
		textCoords = vector3(-1613.76, -1027.69, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_fingate',
		objYaw = 140.0,
		objCoords  = vector3(-1623.66, -1023.82, 13.15),
		textCoords = vector3(-1623.84, -1023.03, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_fingate',
		objYaw = 140.0,
		objCoords  = vector3(-1614.99, -1021.92, 13.15),
		textCoords = vector3(-1615.48, -1021.44, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_fingate',
		objYaw = 140.0,
		objCoords  = vector3(-1616.21, -1023.62, 13.15),
		textCoords = vector3(-1617.03, -1023.41, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_fingate',
		objYaw = 230.0,
		objCoords  = vector3(-1610.34, -1023.08, 13.15),
		textCoords = vector3(-1610.51, -1023.92, 13.15),
		authorizedJobs = { 'police' },
		locked = true
	},--]]

-----Bean Machine-----
	{
		textCoords = vector3(-627.04, 239.05, 81.88),
		authorizedJobs = { 'restaurant' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_csr_door_r',
				objYaw =  270.0,
				objCoords = vector3(-627.07 ,238.63 , 81.88)
			},

			{
				objName = 'v_ilev_csr_door_l',
				objYaw = 270.0,
				objCoords = vector3(-627.09 ,239.38 ,81.88)
			}
		}
	},
	
-----Park Ranger-----
	{
		objName = 'prop_pr_door2',
		objYaw = 0.0,
		objCoords  = vector3(386.85, 792.40, 187.69),
		textCoords = vector3(386.80, 792.86, 188.28),
		authorizedJobs = { 'police' },
		locked = false
	},
	
	{
		objName = 'prop_pr_door2',
		objYaw = 90.0,
		objCoords  = vector3(388.43, 798.84, 187.68),
		textCoords = vector3(388.43, 798.84, 188.28),
		authorizedJobs = { 'police' },
		locked = false
	},
	
	{
		objName = 'prop_pr_gate_door',
		objYaw = 90.0,
		objCoords  = vector3(383.59, 796.76, 187.68),
		textCoords = vector3(383.59, 796.76, 188.28),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'prop_pr_gate_door',
		objYaw = 0.0,
		objCoords  = vector3(380.66, 795.62, 187.68),
		textCoords = vector3(380.66, 795.62, 188.28),
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'prop_pr_door2',
		objYaw = -90.0,
		objCoords  = vector3(384.68, 796.08, 190.49),
		textCoords = vector3(384.68, 796.08, 191.28),
		authorizedJobs = { 'police' },
		locked = false
	},
	
	{
		textCoords = vector3(379.24, 792.86, 191.28),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prop_pr_door',
				objYaw =  0.0,
				objCoords = vector3(379.80, 793.23, 190.49)
			},

			{
				objName = 'prop_pr_door',
				objYaw = 180.0,
				objCoords = vector3(378.40, 793.05, 190.49)
			}
		}
	},
	
}