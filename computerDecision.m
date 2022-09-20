function [totalAI, cardPile, computerCards, computerHit] = computerDecision(computerCards, cardPile, playerHit, firstCard)
% return the total value of computer's cards and remove that card out of the pile
% Input: computerCards -- computer's cards
% Input: cardPile -- the decks of cards
% Input: playerHit -- if player hit and get the third card (1 means yes/0 means no)
% Input: firstCard -- player's first card which is face up
% Output: totalAI -- the total value of computer's cards
% Output: cardPile -- the decks of cards
% Output: computerCards -- computer's cards
 
 
% Firstly, if the total value of first two cards is less than or equal to 11, computer must hit because the
% total will not exceed 21 in any case
 
% Secondly, When total value of the first two is 14, we hope the third card can be
% between 1-7. That odds will be 28/(52-4) = 0.58. Even if the four cards that
% have already distuibuted are all between 1-7, the odds will be 24/48 = 0.5
% Thus, if the total value of the first two is 14, the odds that computer
% will have a better value is between 0.5 - 0.58. And the odds will increase
% as the total value of the first two decreases
 
% Moreover, when player's firstCard >= 8 the odds that player's second
% card >= 6 is 28/(52-4)= 0.58. Even if the four cards that have already
% distuibuted are all between 6 - k, the odds will be 0.5. Hence, when
% player's first card is bigger or equal to 8, the odds that the total value of player's
% first two cards is bigger than computer's value is between 0.5 - 0.58.
% Under that circumstance, if the player hits, the computer will hit. If
% the player does not hit or firstCard < 8, there is a 66.6% probability that the
% computer will hit.
 
index = length(computerCards) + 1;
totalAI = 0;
for i = 1:1:length(computerCards)
    totalAI = totalAI + computerCards(i);
end
computerHit = false; 
 
if totalAI <= 11
    [computerCards(index),cardPile] = DistributeACard( cardPile );
    totalAI = totalAI + computerCards(index);
    computerHit = true;
    index = index + 1;
elseif totalAI <= 14
    if firstCard >= 8 && playerHit
        [computerCards(index),cardPile] = DistributeACard( cardPile );
        totalAI = totalAI + computerCards(index);
        computerHit = true;
        index = index + 1;
    else
        arr = [1,1,2];
        idx=randperm(length(arr),1);
        if arr(idx) == 1 %there is a 66.6% probability that the computer will hit.
            [computerCards(index),cardPile] = DistributeACard( cardPile );
            totalAI = totalAI + computerCards(index);
            computerHit = true;
            index = index + 1;
        end
    end
end
end