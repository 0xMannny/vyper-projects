players: DynArray[address, 100]
losers: DynArray[address, 100]
odds: uint256
playersTurn: uint256
creator: address


@external
def __init__():
    self.creator = msg.sender


@external
def setOdds(oneInThisMany: uint256):
    if msg.sender == self.creator:
        self.odds = oneInThisMany


@external
def addPlayer(player: address):
    sum: uint256 = 0
    if player not in self.losers:
        self.players.append(player)


@internal
def lose(player: address):
    self.players = []
    self.losers.append(player)


@internal
def random() -> uint256:
    return block.number % self.odds + 1
    

@external
def play():
    randomNum: uint256 = self.random()
    if randomNum == 1:
        self.lose(self.players[self.playersTurn])
    elif self.playersTurn == 99:
        self.playersTurn = 0
    else:
        self.playersTurn += 1


@external
def isALoser(player: address) -> bool:
    sum: uint256 = 0
    return player in self.losers
