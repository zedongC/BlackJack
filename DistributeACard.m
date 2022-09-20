function [value, newCardPile] = DistributeACard( cardPile )
% return the value of a random card and remove that card out of the pile
% Input: cardPile -- the decks of cards
% Output: value -- the value of the card that was distributed
% Output: newCardPile -- the decks of cards after distributing

randomNum = randi([1,length(cardPile)]); % generate a random number between 1 and the number of ramining cards

value = cardPile(randomNum); % get the value of the random card

newCardPile = cardPile; %copy the pile
newCardPile(randomNum) = []; %remove the card out of the original pile
end

