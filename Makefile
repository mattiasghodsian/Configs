install:
	@echo "Installing..."
	@sudo chmod +x ./scripts/*
	
	@./scripts/app.sh
	@./scripts/gnome.sh
	@./scripts/aliases.sh

install-dev:
	@echo "Installing dev command..."
	@sudo cp ./scripts/dev.sh /usr/local/bin/dev

uninstall:
	@echo "Uninstalling..."
	@sudo rm /usr/local/bin/dev
	@echo "Uninstallation complete. App/theme packages not removed."
