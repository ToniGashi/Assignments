--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    if self.score > -1 then
        if self.score<10 then
            love.graphics.setFont(mediumFont)
            self.image= love.graphics.newImage('bronze.png')
            self.width=self.image:getWidth()
            self.height = self.image:getHeight()
            self.x = VIRTUAL_WIDTH /2 - (self.width/2)
            self.y = VIRTUAL_HEIGHT/2 - (self.height/2)/2
            love.graphics.draw(self.image,self.x,self.y)
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('but here you go... a medal for trying',0,130,VIRTUAL_WIDTH,'center')
        else
            if self.score<20 then
            self.image= love.graphics.newImage('silver.png')
            self.width=self.image:getWidth()
            self.height = self.image:getHeight()
            self.x = VIRTUAL_WIDTH /2 - (self.width/2)
            self.y = VIRTUAL_HEIGHT/2 - (self.height/2)
            love.graphics.draw(self.image,self.x,self.y)
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('You did good, but you can do better than this.',0,130,VIRTUAL_WIDTH,'center')
            else
                self.image= love.graphics.newImage('gold.png')
                self.width=self.image:getWidth()
                 self.height = self.image:getHeight()
                self.x = VIRTUAL_WIDTH /2 - (self.width/2)
                self.y = VIRTUAL_HEIGHT/2 - (self.height/2)
                love.graphics.draw(self.image,self.x,self.y)
                love.graphics.setFont(flappyFont)
                love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
                love.graphics.setFont(mediumFont)
                love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
                love.graphics.printf('You did it congratulations!',0,130,VIRTUAL_WIDTH,'center')
            end
        end
    end         
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end