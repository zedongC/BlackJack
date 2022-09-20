clc
clear

%intro
fprintf('Welcome to Black jack!!!!!!\n\n');
fprintf('The object of the game is to win money by creating card totals\n');

fprintf('higher than those of the computer''s hand but not exceeding 21.\n');
fprintf('On your turn, you can choose to "hit"(take a card), or "stand"\n');
fprintf('(end your turn and stop without taking a card).\n\n');

start = input('Are you ready(1 as yes/0 as no): ');
% if users do not input correctly, keep prompting them to enter
% correctly
while start ~= 1 && start ~= 0
    fprintf('Input Error! Please use the right input format!\n');
    start = input('Are you ready(1 as yes/0 as no): ');
end
if start == 1
    fprintf('Let''s go!!!\n\n');
else
    fprintf('Fine...Bye');
end
 
goOn = 1;
%record the win rate and the number of rounds
computerWin = 0;
playerWin = 0;
count = 0;
 
while (goOn == 1 && start == 1) %use loop to calculate the win rate
    
    count = count + 1;
    cardPile = [1,2,3,4,5,6,7,8,9,10,10,10,10, 1,2,3,4,5,6,7,8,9,10,10,10,10, 1,2,3,4,5,6,7,8,9,10,10,10,10, 1,2,3,4,5,6,7,8,9,10,10,10,10];
    
    %Distribute random cards to the computer and update the card pile
    [computerCards(1),cardPile] = DistributeACard( cardPile );
    [computerCards(2),cardPile] = DistributeACard( cardPile );
    fprintf('\n\n-----------------Round %i-------------------\n', count);
    fprintf('The first card of computer:  %.f \n', computerCards(1)); %only show the first card of the computer to the player
    
    %Player part
    %Distribute random cards to player and update the card pile and show
    %them to the player
    [playerCards(1),cardPile] = DistributeACard( cardPile );
    [playerCards(2),cardPile] = DistributeACard( cardPile );
    fprintf('Your first card:  %.f \n', playerCards(1));
    fprintf('Your second card:  %.f \n\n', playerCards(2));
 
    totalPlayer = 0;
    cardNum = 3;
    
    %ask player hit or not
    decision = input('Do you want to hit(1 as yes/0 as no): ');
    playerHit = false;
    if decision == 1
        [playerCards(cardNum),cardPile] = DistributeACard( cardPile );
        playerHit = true;
        fprintf('Your cards: ');
        for i = 1:1:length(playerCards)
                fprintf('%i  ', playerCards(i));
                totalPlayer = totalPlayer + playerCards(i);
        end
    end
    
    computerHit = true;
    % Make the computer decision and renew the card pile and computer's cards
        [totalAI, cardPile, computerCards, computerHit] = computerDecision(computerCards, cardPile, playerHit, playerCards(1));  
    
        %keep asking player hit or not until she/he say no
    while playerHit
        
        cardNum = cardNum + 1;
        decision = input('\nDo you want to hit again(1 as yes/0 as no): ');
        if decision == 1
            [playerCards(cardNum),cardPile] = DistributeACard( cardPile );
            fprintf('Your cards: ');
            for i = 1:1:length(playerCards)
                fprintf('%i  ', playerCards(i));
                totalPlayer = totalPlayer + playerCards(i);
            end
        else
            playerHit = false;
        end
        
        % Make the computer decision and renew the card pile and computer's cards
        while computerHit
            [totalAI, cardPile, computerCards, computerHit] = computerDecision(computerCards, cardPile, playerHit, playerCards(1));
        end
    end
    
    % Make the computer decision and renew the card pile and computer's cards
    while computerHit
        [totalAI, cardPile, computerCards, computerHit] = computerDecision(computerCards, cardPile, playerHit, playerCards(1));
    end
    
    %declare and record who wins the game
    [computerWin, playerWin] = gameResult(computerWin, playerWin, playerCards, computerCards);

 
    goOn = input('\nDo you want to play one more round(1 as yes/0 as no): ');

    % if users do not input correctly, keep prompting them to enter
    % correctly
    while goOn ~= 1 && goOn ~= 0
        fprintf('Input Error! Please use the right input format!\n');
        goOn = input('Do you want to play one more round(1 as yes/0 as no): ');

    end
    %clear these two arrays
    clear("playerCards");
    clear("computerCards");
end
 
%show the results
if start == 1
    rate = playerWin / (playerWin + computerWin);
    printResult(rate, count);
else
end