Cmp.RelRastreamento = function() {
    
    var private = {

        render: function() {

            Cmp.createInput({
                id: 'inputPlaca',
                renderTo: '#divInputPlaca',
                label: 'Placa do veículo',
                width: '200px'
            });

            Cmp.createInput({
                id: 'inputNomeFuncionario',
                renderTo: '#divInputNomeFuncionario',
                label: 'Nome do Funcionário',
                width: '200px'
            });

            Cmp.createInput({
                id: 'inputDataInicioOcorrencia',
                renderTo: '#divInputDataInicioOcorrencia',
                label: 'Data Início',
                width: '200px'
            });
            
            document.getElementById('inputDataInicioOcorrencia').setAttribute('type', 'date');
            
            Cmp.createInput({
                id: 'inputDataFimOcorrencia',
                renderTo: '#divInputDataFimOcorrencia',
                label: 'Data Fim',
                width: '200px'
            });
            
            document.getElementById('inputDataFimOcorrencia').setAttribute('type', 'date');

            Cmp.createButton({
                id: 'btnBuscar',
                renderTo: '#divBtnConsultar',
                text: 'Buscar',
                handler: function() {
                    private.buscar();
                }
            });

            Cmp.createGrid({
                id: 'gridDadosRastreamento',
                renderTo: '#divCmpGridRastreamento',
                header: [
                    {
                        text: 'Placa',
                        field: 'placa'
                    }, {
                        text: 'Funcionário',
                        field: 'funcionario',
                        width: 150
                    }, {
                        text: 'Data',
                        field: 'data_ocorrencia',
                        width: 150
                        
                    }, {
                        text: 'Vel. Max.',
                        field: 'vel_maxima',
                        width: 150
                    }, {
                        text: 'Vel. Reg.',
                        field: 'vel_registrada',
                        width: 150
                    }, {
                        text: 'Diff. Vel.',
                        field: 'diff_vel',
                        width: 150,
                    }, {
                        text: 'Latitude',
                        field: 'latitude',
                        width: 150
                    }, {
                        text: 'Longitude',
                        field: 'longitude',
                        width: 150
                    }
                ]
            });

            private.buscar();
        },

        buscar: function() {
            Cmp.showLoading();
            Cmp.request({
                url: 'index.php?mdl=relRastreamento&file=ds_rastreamento.php',
                params: {
                    placa: Cmp.get('inputPlaca').getValue(),
                    nomeFuncionario: Cmp.get('inputNomeFuncionario').getValue(),
                    dataInicioOcorrencia: Cmp.get('inputDataInicioOcorrencia').getValue(),
                    dataFimOcorrencia: Cmp.get('inputDataFimOcorrencia').getValue(),
                },
                success: function(res) {
                    Cmp.hideLoading();
                    console.log(res)
                    if(res.status == 'success') {
                        res.data.forEach(row => {
                            row.diff_vel = row.diff_vel + '%';
                        });
                        Cmp.get('gridDadosRastreamento').loadData(res.data);
                    } else {
                        Cmp.showErrorMessage(res.message || 'Ocorreu um erro na requisição');
                    }
                }
            });
        }
    };

    this.init = function() {
        private.render();
    };
};
