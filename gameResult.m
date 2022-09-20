function [ai, p] = gameResult(ai, p, playerCards, computerCards)
% return both the computer's and player's numbers of wining round and print
% the game result out
% Input: ai -- the number of computer's wining round
% Input: p -- the number of player's wining round
% Input: playerCards -- player's cards
% Input: computerCards -- computer's cards
% Output: ai -- the number of computer's wining round
% Output: p -- the number of player's wining round

%print both the player's and computer's cards out and calculate the total
totalAI = 0;
fprintf('Computer cards: ');
for i = 1:1:length(computerCards)
    fprintf('%i  ', computerCards(i));
    totalAI = totalAI + computerCards(i);
end
totalPlayer = 0;
fprintf('\nYour cards: ');
for i = 1:1:length(playerCards)
    fprintf('%i  ', playerCards(i));
    totalPlayer = totalPlayer + playerCards(i);
end

fprintf('\n');

% If one of them have more than 21 points
if totalPlayer == totalAI
    fprintf('Tie');
else
    switch totalPlayer > totalAI
        case 1 %Player's points > computer's points
            if totalPlayer > 21
                if totalAI <= 21
                    fprintf('AI wins!'); %Player's points larger than 21 but computer's smaller than or equal to 21
                    ai = ai + 1;
                else
                    fprintf('Tie'); %Both bigger than 21
                end
            else
                fprintf('You win!'); %Player's points larger than computer's and smaller than or equal to 21
                p = p + 1;
            end
        case 0 %Player's points < computer's points
            if totalAI > 21
                if totalPlayer <= 21
                    fprintf('You win!');
                    p = p + 1;
                else
                    fprintf('Tie');
                end
            else
                fprintf('AI wins!');
                ai = ai + 1;
            end
    end
end
end

