;;; ------------------------------------------------------------
;;; Function: The map
;;; ------------------------------------------------------------
;;; Description: 
;;; 1. The map is make up with two-dimensional array with 21x21
;;; 2. The map possess path cost values from nodes to nodes
;;; ------------------------------------------------------------
;;; Written by: Chong Hoe Ren  
;;; ------------------------------------------------------------

(setf map (make-array '(21 21)
	:initial-contents '((NIL Arad Zerind Oradea Sibiu Fagaras Rimniou_Viloea Timisoara Lugoj Mehadia Dobreta Craiova Pitesti Bucharest Giurgiu Urzioeni Hirsova Etorie Vaslui Iasi Neamt)
						(Arad NIL 75 NIL 140 NIL NIL 118 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Zerind 75 NIL 71 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Oradea NIL 71 NIL 151 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Sibiu 140 NIL 151 NIL 99 80 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Fagaras NIL NIL NIL 99 NIL NIL NIL NIL NIL NIL NIL NIL 211 NIL NIL NIL NIL NIL NIL NIL)
						(Rimniou_Viloea NIL NIL NIL 80 NIL NIL NIL NIL NIL NIL 146 97 NIL NIL NIL NIL NIL NIL NIL NIL)
						(Timisoara 118 NIL NIL NIL NIL NIL NIL 111 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Lugoj NIL NIL NIL NIL NIL NIL 111 NIL 70 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Mehadia NIL NIL NIL NIL NIL NIL NIL 70 NIL 75 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Dobreta NIL NIL NIL NIL NIL NIL NIL NIL 75 NIL 120 NIL NIL NIL NIL NIL NIL NIL NIL NIL)
						(Craiova NIL NIL NIL NIL NIL 146 NIL NIL NIL 120 NIL 138 NIL NIL NIL NIL NIL NIL NIL NIL)
						(Pitesti NIL NIL NIL NIL NIL 97 NIL NIL NIL NIL 138 NIL 101 NIL NIL NIL NIL NIL NIL NIL)
						(Bucharest NIL NIL NIL NIL 211 NIL NIL NIL NIL NIL NIL 101 NIL 90 85 NIL NIL NIL NIL NIL)
						(Giurgiu NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 90 NIL NIL NIL NIL NIL NIL NIL)
						(Urzioeni NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 85 NIL NIL 98 NIL 142 NIL NIL)
						(Hirsova NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 98 NIL 86 NIL NIL NIL)
						(Etorie NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 86 NIL NIL NIL NIL)
						(Vaslui NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 142 NIL NIL NIL 92 NIL)
						(Iasi NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 92 NIL 87)
						(Neamt NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 87 NIL)
						)))