(define (domain gripper)  
   (:requirements :adl :typing)
   (:types room ball gripper)
   (:predicates (at-robby ?r1 - room)
	       (at ?b - ball ?r - room)
    	       (free ?g - gripper)		
                (carry ?o - ball ?g - gripper))

(:action move       
   :parameters  (?from - room ?to - room)
   :precondition (and (at-robby ?from ))      
   :effect (and  (at-robby ?to )
	     (not (at-robby ?from ))))

(:action pick       
  :parameters (?obj - ball ?room - room ?gripper - gripper)       
  :precondition  (and  (at ?obj ?room) (at-robby ?room) (free ?gripper))      
  :effect (and (carry ?obj ?gripper) 
                 (not (at ?obj ?room)) 
                (not (free ?gripper))))


; Add a drop operator that allows the robot to drop the ball. Carefully consider preconditions and post-conditions

(:action drop       
  :parameters (?obj - ball ?room - room ?gripper - gripper)       
  :precondition (and  
                (carry ?obj ?gripper)  ; The robot must be carrying the object
                (at-robby ?room)       ; The robot must be in the specified room
                (not (free ?gripper))  ; The gripper must not be free (i.e., it is holding something)
                )      
  
  :effect (and 
          (not (carry ?obj ?gripper)) ; The robot is no longer carrying the object
          (free ?gripper)        ; The gripper is now free
          (at ?obj ?room)        ; The object is now in the specified room
       )
)

)