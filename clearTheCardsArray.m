function [playerCards, computerCards] = clearTheCardsArray(playerCards, computerCards)

for i = 1:1:length(playerCards)
    playerCards(i) = [];
end

for i = 1:1:length(computerCards)
    computerCards(i) = [];
end

