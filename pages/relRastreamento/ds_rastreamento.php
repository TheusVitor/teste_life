<?php

$where = ["r.vel_registrada > v.vel_maxima"];

$placa = !empty($_REQUEST['placa']) ? $_REQUEST['placa'] : null;
$nomeFuncionario = !empty($_REQUEST['nomeFuncionario']) ? $_REQUEST['nomeFuncionario'] : null;
$dataInicio = !empty($_REQUEST['dataInicioOcorrencia']) ? $_REQUEST['dataInicioOcorrencia'] : null;
$dataFim = !empty($_REQUEST['dataFimOcorrencia']) ? $_REQUEST['dataFimOcorrencia'] : null;

if ($placa) {
    $where[] = "v.placa LIKE '%{$placa}%'";
}

if ($nomeFuncionario) {
    $where[] = "f.nome LIKE '%{$nomeFuncionario}%'";
}

if ($dataInicio && $dataFim) {
    $where[] = "r.data_ocorrencia BETWEEN '{$dataInicio}' AND '{$dataFim} 23:59:59'";
}

$whereSql = count($where) > 0 ? 'WHERE ' . implode(' AND ', $where) : '';

$db = new Database();

if ($db->connect()) {
    $dados = $db->sqlQueryArray(
        "SELECT
            v.placa,
            f.nome AS funcionario,
            r.data_ocorrencia,
            v.vel_maxima AS vel_maxima,
            r.vel_registrada AS vel_registrada,
            ROUND(((r.vel_registrada - v.vel_maxima) / v.vel_maxima) * 100) AS diff_vel,
            r.latitude,
            r.longitude
        FROM rastreamento r
        INNER JOIN veiculo v ON r.veiculo_id = v.id
        INNER JOIN funcionario f ON r.funcionario_id = f.id
        {$whereSql}"
    );

    echo json_encode(array(
        'status' => 'success',
        'data' => $dados
    ));
} else {
    echo json_encode(array(
        'status' => 'failure',
        'message' => 'Erro ao conectar ao banco'
    ));
}
