(define (domain gripper)  
   (:requirements :adl :typing)
   (:types room ball gripper)
   (:predicates (at-robby ?r1 - room)
                (at ?b - ball ?r - room)
                (connect ?r1 - room ?r2 - room)
                (free1 ?g - gripper)
                (free2 ?g - gripper)  
                (carry1 ?o - ball ?g - gripper)
                (carry2 ?o - ball ?g - gripper)

   )

(:action move       
   :parameters  (?from - room ?to - room)
   :precondition (and 
                  (at-robby ?from)
                  (or(connect ?from ?to) (connect ?to ?from))
                  )     
   :effect (and  (at-robby ?to)
                 (not (at-robby ?from)))   
)

(:action pick       
  :parameters (?obj - ball ?room - room ?gripper - gripper)       
  :precondition (and  
                  (at ?obj ?room) 
                  (at-robby ?room) 
                  (or(free1 ?gripper) (free2 ?gripper))    
                )     
  :effect (and
              (not (at ?obj ?room))
              (when (free1 ?gripper) 
                    (and(not (free1 ?gripper)) (carry1 ?obj ?gripper)))
              (when (and(free2 ?gripper) (not (free1 ?gripper))) 
                    (and(not (free2 ?gripper))
                    (carry2 ?obj ?gripper))
                    )
          )  
)

(:action drop       
  :parameters (?obj - ball ?room - room ?gripper - gripper)       
  :precondition (and  
                (or(carry1 ?obj ?gripper) (carry2 ?obj ?gripper))  
                (at-robby ?room)       
                )      
  :effect (and
          (when (carry1 ?obj ?gripper) 
                (and(free1 ?gripper)
                (not(carry1 ?obj ?gripper)))
                )
          (when (carry2 ?obj ?gripper) 
                (and(free2 ?gripper)
                (not(carry2 ?obj ?gripper)))
                )

          (at ?obj ?room)
         )
)
)