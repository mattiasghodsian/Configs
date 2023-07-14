install:
	@echo "Installing..."
	@sudo cp ./scripts/dev.sh /usr/local/bin/dev
	@sudo chmod +x ./scripts/*
	
	@./scripts/app.sh
	@./scripts/aliases.sh

uninstall:
	@echo "Uninstalling..."
	@sudo rm /usr/local/bin/dev
	@echo "Uninstallation complete. Other packages not removed."
