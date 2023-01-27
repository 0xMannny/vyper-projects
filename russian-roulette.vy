players: DynArray[address, 100]
losers: DynArray[address, 100]
odds: uint256
playersTurn: uint256
creator: address

@external
def __init__():
    self.creator = msg.sender
    self.playersTurn = 0

@external
def setOdds(oneInThisMany: uint256):
    if msg.sender == self.creator:
        self.odds = oneInThisMany

@external
def addPlayer(player: address):
    sum: uint256 = 0
    if player not in losers:
        self.players.append(player)

@internal
def lose(player: address):
    self.players = []
    self.losers.append(player)

@external
def random():
    # logic goes here

@external
def play():
    # logic goes here

@external
def isALoser(player: address) -> (bool):
    sum: uint256 = 0
    for i in self.losers:
        if i == player:
            sum += 1
    if sum == 0:
        return False
    else:
        return True
