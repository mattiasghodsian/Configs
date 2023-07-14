install:
	@echo "Installing scripts..."
	@sudo cp ./scripts/dev.sh /usr/local/bin/dev
	@sudo chmod +x /usr/local/bin/dev

	@echo "Configuring zshrc..."
	@sudo chmod +x ./scripts/zshrc.sh
	@./scripts/zshrc.sh

	@echo "Installation complete."

uninstall:
	@echo "Uninstalling..."
	@sudo rm /usr/local/bin/dev
	@echo "Uninstallation complete."
