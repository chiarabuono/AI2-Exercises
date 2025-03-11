(define (problem gripper-x-1)   
(:domain gripper)   
(:objects rooma roomb - room 
                ball2 ball1 - ball  
                left - gripper )   
(:init (at-robby rooma)
         (free left)
         (at ball2 rooma)
         (at ball1 rooma))  
 (:goal (and (at ball2 roomb)
               (at ball1 roomb)))
)
