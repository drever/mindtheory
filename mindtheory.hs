import Wumpus

-- Innere perspektive 
data AgentWorld = AgentWorld InnerWorld SelfModel
data InnerWorld = InnerWorld WorldModel [InnerState]

data InnerState = InnerState String
data SelfModel = SelfModel IState String
                 
data IState = IState InnerIState OuterIState
data OuterIState = BodyConfigurationModel ActuatorActionModel
data InnerIState = InnerActionModel
 
 

type BodyConfigurationModel = String

type WorldModel = String
type RestWorldModel = String


type ActuatorActionModel = String
type InnerActionModel = String
type EffectOnInnerWorld = String
type Action = String
type EffectOnWorld = String

-- Aussenperspektive (Allwissende Perspektive des wissenschaftlichen Beobachters)
data World = World Environment Agent 

type  Environment = String

data Agent = Agent [Actuator] [SensorState] BodyConfiguration AgentWorld
data BodyConfiguration = BodyConfiguration String
type Actuator = String
type SensorState = String

-- Funktionen

agentFunction :: Agent -> Environment -> (Agent, Environment)
agentFunction agent env = (agent, env)

-- 3 Prozesse
feedbackPhysicalActivity :: String
feedbackPhysicalActivity = undefined

feedbackMentalActivity :: String
feedbackMentalActivity = undefined

--  1) Selbstmodell wird aus der Welt heraus geloest 
--  2) Selbstmodell wird zur Umwelt in beziehung gesetzt
mainProcess :: String -> String
mainProcess x = relateWithWorld $ excavate x

excavate :: String -> String
excavate x = x

relateWithWorld :: String -> String
relateWithWorld = undefined

relateWithInnerWorld :: SelfModel -> InnerWorld -> (SelfModel, InnerWorld)
relateWithInnerWorld = undefined

relateWithOuterWorld :: SelfModel -> WorldModel -> (SelfModel, WorldModel)
relateWithOuterWorld = undefined

updateInnerWorld :: InnerWorld -> InnerWorld 
updateInnerWorld = undefined


-- Die ersten beiden Parameter sind die innere Welt vor der Aktion und die innere Welt nach der Aktion
excavateInnerActive :: InnerWorld -> InnerWorld -> (InnerActionModel, EffectOnInnerWorld)
excavateInnerActive = undefined

excavateWorldPassive :: WorldModel -> (BodyConfigurationModel, RestWorldModel)
excavateWorldPassive = undefined

-- Die ersten beiden Parameter sind das Weltmodell vor der Aktion und das Weltmodell nach der Aktion
excavateWorldActive :: WorldModel -> WorldModel -> (ActuatorActionModel, Action, EffectOnWorld, RestWorldModel)
excavateWorldActive = undefined

-- Ausfuehrung

-- Simulation von einem Zeitschritt

--Main

sense :: Agent -> Environment -> Agent
sense  = undefined

act :: Agent -> Environment -> Environment
act = undefined

simulationStep :: World -> World
simulationStep (World env agent) = let 
                newAgent = sense agent env
                newEnv = act newAgent env
            in World newEnv newAgent                 

main = putStrLn "Brace yourself, SKYNET is comming to get you!"


