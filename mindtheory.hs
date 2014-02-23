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
-- Aussenperspektive (Allwissende Perspektive des wissenschaftlichen Beobachters)
data World = World Agent Environment
data Enviromment = Environment String

data Agent = Agent [Actuator] [Sensor] BodyConfiguration AgentWorld
data BodyConfiguration = BodyConfiguration String
type Actuator = String
type Sensor = String

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
mainProcess x = relateWithWorld . excavate x

relateWithWorld :: String -> String
relateWithWorld = undefined

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
