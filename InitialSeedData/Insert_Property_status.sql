USE [Rightmove]
GO

INSERT INTO [Sales].[PropertyForSaleStatus] ([Id],[Name]) VALUES
(1, 'Available'),
(2, 'SSTC (sales only)'),
(3, 'SSTCM (Scottish sales only)'),
(4, 'Under Offer (sales only)'),
(5, 'Reserved (sales only)')

GO

INSERT INTO [Lettings].[PropertyToLetStatus] ([Id],[Name]) VALUES
(1, 'Available'),
(6, 'Let Agreed (lettings only)')

