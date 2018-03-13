echo '<<<---------------------------->>> construindo projeto. <<<<---------------------------------------->>>>'
cd ./photopic/
npm run build
cd ../
echo '<<<---------------------------->>> construção do projeto com sucesso. <<<<---------------------------------------->>>>'
echo '<<<---------------------------->>> copiando arquivos para o servidor. <<<<---------------------------------------->>>>'
cp ./photopic/dist/build.js ./server/public/dist
cp ./photopic/index.html ./server/public
echo '<<<---------------------------->>> arquivos copiados com sucesso. <<<<---------------------------------------->>>>'
echo '<<<---------------------------->>> compilando imagens. <<<<---------------------------------------->>>>'
docker-compose build
echo '<<<---------------------------->>> imagens compiladas com sucesso. <<<<---------------------------------------->>>>'
echo '<<<---------------------------->>> desligar containers antigos. <<<<---------------------------------------->>>>'
docker-compose down
echo '<<<---------------------------->>> containers antigos desligados com sucesso. <<<<---------------------------------------->>>>'
echo '<<<---------------------------->>> subindo novos containers. <<<<---------------------------------------->>>>'
docker-compose up -d
echo '<<<---------------------------->>> todos novos containers rodando com sucesso. <<<<---------------------------------------->>>>'
docker-compose ps
