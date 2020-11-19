for x in *
do
filename=$x/Dockerfile
if [ ! -f $filename ]
then
        echo -e "FROM image:latest \nRUN apt-get update && apt-get install -y --no-install-recommends \\ \n unixodbc \\ \n unixodbc-dev \\ \n libpq-dev \nWORKDIR /$x\nCOPY requirements.txt ./\n RUN pwd \n RUN python3 --version \nRUN pip3 install --no-cache-dir -r requirements.txt\nCOPY . .\nCMD [ \"python3\", \"./$x.py\" ]" > $x/Dockerfile;
fi
done
