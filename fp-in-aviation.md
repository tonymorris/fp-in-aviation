# Functional Programming in Aviation

In this talk&demo, we have a look at some of the low-hanging problems in general
aviation and how functional programming can be applied to provide significant
improvements in efficiency and air safety. The current solutions to problems
such as navigation, traffic/terrain collision avoidance and weight/balance 
calculations will be demonstrated to the audience, mostly for amusement. More
seriously, we will have a look at the legacy that has led to the way things are,
and how to improve by applying our programming skills.

We will look at:
* how aviation safety is regulated
* how aeronautical services are provided to flight operators
* how aeronautical navigation is conducted and regulated
* how the weight and balance for a flight is conducted
* the methods by which aircraft and ground coordinate between each other

We will see:
* some real (and basic) data management problems in aviation, that very
  obviously threaten safety, then solve them, using programming.
* we will see a live demonstration of aeronautical navigation methods,
  investigate incident reports where lives were lost as a result, and consider
  how our programming skills can yield improvements, possibly even save lives.
* we will conduct a real weight&balance calculation for a flight, then once
  hilarity inevitably ensues, we will look at the problems that arise by this
  method, then solve them using data structures and functional programming. Some
  of these practical problems are obvious, even to a non-aviator, and the
  predictable incident reports are the end result.
* finally, we will have a look at a live demonstration of a software defined
  radio (SDR), receiving ADS-B transmissions from aircraft (live), an AHRS
  implementation and GNSS receiver using off-the-shelf, low-cost parts. We will
  look at why these instruments are helpful to aircraft pilots and interact with
  that device using the Haskell programming language.
