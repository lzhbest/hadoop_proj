package com.ryan.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

import java.io.IOException;

public class HDFSClient {
    public static FileSystem getFileSystem() throws IOException {
        Configuration conf = new Configuration();
        conf.set("fs.defaultFS", "hdfs://spark1234:8020");

        FileSystem fs = FileSystem.get(conf);
        return fs;
    }

    /**
     * 创建目录
     * @throws IOException
     */
    public static void mkdirFile() throws IOException {
        FileSystem fs = getFileSystem();
        fs.mkdirs(new Path("/a1/a2"));
        fs.close();
    }

    /**
     * 上传文件
     * @throws IOException
     */
    public static void putFile() throws IOException {
        FileSystem fs = getFileSystem();
        Path src = new Path("D:/repair_record.txt");
        Path dst = new Path("/a1/a2");
        fs.copyFromLocalFile(src, dst);

        fs.close();
    }

    /**
     * 下载文件
     * @throws IOException
     */
    public static void downFile() throws IOException {
        FileSystem fs = getFileSystem();
        Path dst = new Path("/a1/a2/repair_record.txt");
        Path src = new Path("D:/hdfs");
        fs.copyToLocalFile(false, dst, src, true);

        fs.close();

    }

    /**
     * 读取HDFS文件
     * @throws IOException
     */
    public static void readFile() throws IOException {
        FileSystem fs = getFileSystem();
        Path path = new Path("/a1/a2/repair_record.txt");
        FSDataInputStream in = fs.open(path);
        IOUtils.copyBytes(in, System.out, 4096, false);
        IOUtils.closeStream(in);
        fs.close();
    }






    public static void main(String[] args) throws IOException {
//        mkdirFile();
//        putFile();
//        downFile();
        readFile();
    }



}
