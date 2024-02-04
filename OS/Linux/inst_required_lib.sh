if ! command -v virtualbox &> /dev/null; then
	sudo apt-get update
	sudo apt-get install virtualbox -y
fi

if ! command -v vagrant &> /dev/null; then
	sudo apt-get install vagrant -y
fi

if ! command -v git &> /dev/null; then 
	sudo apt-get install git -y
fi

if ! command -v python &> /dev/null; then 
	sudo apt-get install python -y
fi

if ! command -v pip &> /dev/null; then	
	sudo apt-get install pip -y 
fi

if ! command -v ansible &> /dev/null; then 
	sudo pip install ansible
fi