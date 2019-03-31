// function onLoadShader(gl, fileString, type) {
//     if(type == gl.VERTEX_SHADER) {  // 加载顶点着色器
//         VSHADER_SOURCE = fileString;
//     }
//     if(type == gl.FRAGMENGT_SHADER){
//         FSHADER_SOURCE = fileString;
//     }
//     if(VSHADER_SOURCE && FSHADER_SOURCE){
//         start(gl);
//     }
// }

// function loadShaderFile(gl, fileName, shader) {
//     let request = new XMLHttpRequest();
//     request.onreadystatechange = function () {
//         if (request.readyState === 4 && request.status !== 404) {
//             onLoadShader(gl, request.responseText, shader);
//             // return request.responseText;
//         }
//     }
//     request.open('GET', fileName, true);
//     request.send();
// }
function loadShaderSourceCodes(fileName) {
    let xhr = new XMLHttpRequest();
    let okStatus = document.location.protocol === "http:" ? 0 : 200;
    // console.log(okStatus);
    xhr.open('GET', fileName, false);
    xhr.overrideMimeType("text/plain;charset=utf-8");//默认为utf-8
    xhr.send();
    return xhr.status === okStatus ? xhr.responseText : null;
}

// export { loadShaderFile };