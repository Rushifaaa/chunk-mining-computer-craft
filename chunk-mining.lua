local height = 16
local width = 16
local length = 16

local fuelSlot = 1
local chestSlot = 2
local torchSlot = 3

local function refuel()
    repeat
        turtle.select(fuelSlot)

        if not turtle.refuel() then
            print("Please add some fuel to Slot 1.")
            print("Waiting 2 Seconds...")
            sleep(2)
        end
    until turtle.getFuelLevel() > 200
end

local function placeChest()
    turtle.select(chestSlot)
    turtle.place()
end

print("Welcome to Chunk Mining!")
print("Make sure that \n Slot 1 is Fuel \n Slot 2 is a Chest or Two \n Slot 3 are Torches")
print("The Turtle will mine a Whole Chunk (16x16x16)")

refuel()

turtle.turnLeft()
local _, metadata = turtle.inspect()

if not string.find(metadata.name, "chest") then
    if not turtle.detect() then
        turtle.dig()
        placeChest()

        if turtle.getItemCount(chestSlot) > 1 then
            turtle.turnLeft()

            if turtle.detect() then
                turtle.dig()
                turtle.forward()
                turtle.turnRight()

                if turtle.detect() then
                    _, metadata = turtle.inspect()

                    if not string.find(metadata.name, "chest") then
                        turtle.turnRight()
                        turtle.forward()
                        if turtle.detect() then
                            turtle.dig()
                            turtle.forward()
                            turtle.turnLeft()

                            if turtle.detect then
                                _, metadata = turtle.inspect()
                                if not string.find(metadata.name, "chest") then
                                    turtle.dig()
                                    placeChest()
                                    turtle.turnRight()
                                end
                            end
                        end
                    end
                else
                    placeChest()
                end
            end

            turtle.forward()
            turtle.turnRight()

            if turtle.detect() then
                _, metadata = turtle.inspect()

                if not string.find(metadata.name, "chest") then
                    turtle.turnRight()
                    turtle.forward()
                    if turtle.detect() then
                        turtle.dig()
                        turtle.forward()
                        turtle.turnLeft()

                        if turtle.detect then
                            _, metadata = turtle.inspect()
                            if not string.find(metadata.name, "chest") then
                                turtle.dig()
                                placeChest()
                                turtle.turnRight()
                            end
                        end
                    end
                end
            else
                placeChest()
            end
        end
    else
        placeChest()
    end
end
