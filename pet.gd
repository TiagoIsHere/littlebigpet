extends Node2D  # We're working with 2D nodes.

# Stats for the pet
var hunger = 100
var happiness = 100
var energy = 100

# Progress bars for the stats (using @onready to defer the node lookup until the scene is ready)
@onready var hunger_progressbar = $HungerProgressBar
@onready var happiness_progressbar = $HappinessProgressBar
@onready var energy_progressbar = $EnergyProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set up ProgressBars (these are set in the scene via @onready)
	hunger_progressbar.max_value = 100
	happiness_progressbar.max_value = 100
	energy_progressbar.max_value = 100

	hunger_progressbar.position = Vector2(10, 120)
	happiness_progressbar.position = Vector2(10, 150)
	energy_progressbar.position = Vector2(10, 180)

	# Add ProgressBars to the scene (if not already done in the scene)
	add_child(hunger_progressbar)
	add_child(happiness_progressbar)
	add_child(energy_progressbar)

	# Get the Timer node that you added manually in the editor
	var timer = $Timer  # This refers to the Timer node you added manually

	# Connect the timeout signal of the Timer node to the _on_timer_timeout method
#timer.connect("timeout", self, "_on_timer_timeout")

	# Start the timer
	timer.start()  # Start the timer after it has been added to the scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Here you could do things like continuously decrease hunger over time or check for input.
	pass

# Function called when the timer times out.
func _on_timer_timeout() -> void:
	hunger -= 1
	happiness -= 1
	energy -= 1
	update_stats()  # Update the progress bars to reflect the new values.

# Update the stats on the progress bars.
func update_stats() -> void:
	# Update the progress bars
	hunger_progressbar.value = hunger
	happiness_progressbar.value = happiness
	energy_progressbar.value = energy
