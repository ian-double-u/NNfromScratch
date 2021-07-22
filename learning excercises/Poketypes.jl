#Declaring the abstract type
abstract type PokeType end
#Declaring the sub-types
struct Normal <: PokeType end
struct Fire <: PokeType end
struct Water <: PokeType end
struct Electric <: PokeType end
struct Grass <: PokeType end
struct Ice <: PokeType end
struct Fighting <: PokeType end
struct Poison <: PokeType end
struct Ground <: PokeType end
#Declaing constants that will not change
const NO_EFFECT = 0.0
const NOT_VERY_EFFECTIVE = 0.5
const NORMAL_EFFECTIVE = 1.0
const SUPER_EFFECTIVE = 2.0

#Defining some catch-all interactions
eff(atk::T1, def::T2) where {T1 <: PokeType, T2 <: PokeType} = NORMAL_EFFECTIVE
eff(atk::T, def::T) where {T <: PokeType} = NOT_VERY_EFFECTIVE

#Defining specific interactions between types
eff(atk:: Fighting, def:: Fighting) = NORMAL_EFFECTIVE
eff(atk:: Ground, def:: Ground) = NORMAL_EFFECTIVE
eff(atk::Fire,     def::Grass)    = SUPER_EFFECTIVE
eff(atk::Fire,     def::Ice)      = SUPER_EFFECTIVE
eff(atk::Water,    def::Fire)     = SUPER_EFFECTIVE
eff(atk::Water,    def::Ground)   = SUPER_EFFECTIVE
eff(atk::Electric, def::Water)    = SUPER_EFFECTIVE
eff(atk::Grass,    def::Water)    = SUPER_EFFECTIVE
eff(atk::Grass,    def::Ground)   = SUPER_EFFECTIVE
eff(atk::Ice,      def::Grass)    = SUPER_EFFECTIVE
eff(atk::Ice,      def::Ground)   = SUPER_EFFECTIVE
eff(atk::Fighting, def::Normal)   = SUPER_EFFECTIVE
eff(atk::Fighting, def::Ice)      = SUPER_EFFECTIVE
eff(atk::Poison,   def::Grass)    = SUPER_EFFECTIVE
eff(atk::Ground,   def::Fire)     = SUPER_EFFECTIVE
eff(atk::Ground,   def::Electric) = SUPER_EFFECTIVE
eff(atk::Ground,   def::Poison)   = SUPER_EFFECTIVE
eff(atk::Fire,     def::Water)  = NOT_VERY_EFFECTIVE
eff(atk::Water,    def::Grass)  = NOT_VERY_EFFECTIVE
eff(atk::Electric, def::Grass)  = NOT_VERY_EFFECTIVE
eff(atk::Grass,    def::Fire)   = NOT_VERY_EFFECTIVE
eff(atk::Grass,    def::Poison) = NOT_VERY_EFFECTIVE
eff(atk::Ice,      def::Fire)  = NOT_VERY_EFFECTIVE
eff(atk::Ice,      def::Water)  = NOT_VERY_EFFECTIVE
eff(atk::Fighting, def::Poison) = NOT_VERY_EFFECTIVE
eff(atk::Poison,   def::Ground) = NOT_VERY_EFFECTIVE
eff(atk::Ground,   def::Grass)  = NOT_VERY_EFFECTIVE
eff(atk::Electric, def::Ground) = NO_EFFECT

#Reads value of effectiveness and returns string
function eff_string(effectiveness)
    if effectiveness == 0.0
        return "not effective."
    elseif effectiveness == 0.5
        return "not very effective."
    elseif effectiveness == 1.0
        return "normally effective."
    elseif effectiveness == 2.0
        return "super effective!"
    end
end

#Function for when one pokemon attacks another
#Reads two variables of Type <: PokeType
#Checks the effectiveness of attacker and defender combo
#Prints the result of interaction
function attack(atk, def)
    effectiveness = eff(atk, def)
    println("A Pokemon used a $(typeof(atk)) attack")
    println("against a $(typeof(def)) Pokemon")
    println("it was $(eff_string(effectiveness))")
end

#Defining the Type of the attacker and defender
attacker = Fire()
defender = Fire()

#Checks outcome using attack()
attack(attacker, defender)
